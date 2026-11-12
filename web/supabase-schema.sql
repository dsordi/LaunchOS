-- ============================================================
-- LaunchOS — Acesso externo · Schema + segurança (Supabase)
-- Rode TUDO isto uma vez no Supabase: menu "SQL Editor" -> New query -> cole -> Run.
-- Modelo: cada usuário tem UM registro com todas as suas oportunidades (espelha o
-- localStorage atual). A segurança real é a RLS abaixo (o banco recusa acesso
-- cruzado), não a interface.
-- ============================================================

-- 1) Perfis (papel de cada usuário) — 1:1 com os usuários de autenticação
create table if not exists public.profiles (
  id                uuid primary key references auth.users on delete cascade,
  email             text,
  role              text not null default 'user' check (role in ('super_admin','user')),
  active            boolean not null default true,
  trial_expires_at  timestamptz,
  created_at        timestamptz default now()
);

-- 2) Estado do app por usuário: o array de oportunidades inteiro (JSON)
create table if not exists public.user_state (
  user_id     uuid primary key references auth.users on delete cascade,
  opps        jsonb not null default '[]'::jsonb,
  updated_at  timestamptz default now()
);

-- 3) Auditoria (append-only): login, criações, edições, acessos, tentativas negadas
create table if not exists public.audit_events (
  id          bigint generated always as identity primary key,
  user_id     uuid references auth.users,
  event       text not null,
  detail      jsonb,
  created_at  timestamptz default now()
);

-- 4) Cria o perfil automaticamente quando um usuário novo é criado
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles(id, email) values (new.id, new.email)
  on conflict (id) do nothing;
  return new;
end; $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- 5) Função: o usuário atual é super_admin?
create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select exists(
    select 1 from public.profiles p
    where p.id = auth.uid() and p.role = 'super_admin' and p.active
  );
$$;

-- 6) LIGA a segurança de linha (Row Level Security) em tudo
alter table public.profiles     enable row level security;
alter table public.user_state   enable row level security;
alter table public.audit_events enable row level security;

-- 7) Políticas
-- Perfis: cada um vê o seu; o admin vê e gerencia todos
drop policy if exists prof_read  on public.profiles;
drop policy if exists prof_admin on public.profiles;
create policy prof_read  on public.profiles for select using (id = auth.uid() or public.is_admin());
create policy prof_admin on public.profiles for all    using (public.is_admin()) with check (public.is_admin());

-- Estado: cada um lê/escreve só o SEU; o admin pode LER o de todos (para o painel)
drop policy if exists state_rw on public.user_state;
create policy state_rw on public.user_state for all
  using (user_id = auth.uid() or public.is_admin())   -- leitura: dono ou admin
  with check (user_id = auth.uid());                  -- escrita: só na própria linha

-- Auditoria: só o admin lê; qualquer usuário autenticado insere os próprios eventos
drop policy if exists audit_read on public.audit_events;
drop policy if exists audit_ins  on public.audit_events;
create policy audit_read on public.audit_events for select using (public.is_admin());
create policy audit_ins  on public.audit_events for insert with check (user_id = auth.uid());

-- ============================================================
-- DEPOIS de entrar a 1ª vez com o SEU e-mail, rode isto (troque o e-mail)
-- para virar o administrador master:
--
--   update public.profiles set role = 'super_admin' where email = 'SEU-EMAIL@exemplo.com';
--
-- Para revogar um usuário na hora:
--   update public.profiles set active = false where email = 'email-da-pessoa@exemplo.com';
-- ============================================================
