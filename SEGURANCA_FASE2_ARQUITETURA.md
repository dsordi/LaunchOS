# LaunchOS — Segurança & Acesso Externo · FASE 2: Arquitetura da Solução (teste externo, custo ~R$0)

**Papel:** CTO · **Data:** 2026-11-12 · **Objetivo:** disponibilizar o LaunchOS para o teste de uma lançadora externa, **mantendo 100% das features e do engine**, com **login real**, **persistência no servidor**, **isolamento por usuário** e uma **licença master** para o Davi observar o que cada usuário faz — pelo **menor custo possível (gratuito para o teste)**.

> Pré-requisitos já alinhados pelo Davi: NDA/termos cobrem a confidencialidade; LGPD do teste está de acordo (não é bloqueio agora). O IP (motor/prompts) continua no cliente nesta fase — aceito sob NDA; blindagem via motor server-side fica para uma fase futura, se virar SaaS aberto.

---

## 1. CUSTO: zero para o teste

| Peça | Serviço | Tier gratuito | Suficiente p/ o teste? |
|---|---|---|---|
| Auth + Banco + RLS | **Supabase** (free) | 500 MB Postgres, 50.000 usuários ativos/mês, Auth (magic link / senha / MFA), RLS, APIs | **Folga enorme** (teste é ~2 usuários) |
| Hospedagem do app estático | **Cloudflare Pages** (free) | requests ilimitados, HTTPS, uso comercial OK | Sim |

**Custo total do teste: R$ 0.** Caveat honesto do free tier Supabase: o projeto **pausa após ~1 semana sem acesso** (reativa em 1 clique no painel) — irrelevante durante um teste ativo. Para produção paga depois, o plano Pro é ~US$25/mês.

> Observação de licença (detalhe de CTO): prefira **Cloudflare Pages** ou **Netlify** para o host — o free da Vercel ("Hobby") é formalmente não-comercial; para um teste de empresa, CF Pages/Netlify são mais limpos juridicamente.

---

## 2. STACK E POR QUÊ

**Um serviço cobre tudo (mínima complexidade): Supabase** (Postgres + Auth + Row Level Security), com o **mesmo `app/index.html`** hospedado num host estático e falando com o Supabase pelo SDK JS.

- **Auth gerenciada** (não escrevo criptografia): hashing, sessão/JWT, expiração, recuperação, MFA, rate limit — tudo pronto e auditado.
- **RLS no banco** = isolamento e read/write control **de verdade** (no Postgres, não na interface).
- **Mesmo app, mesmas features, mesmo engine** — muda só onde o dado mora.

---

## 3. MODELO DE DADOS (mínimo)

Três tabelas. A oportunidade é gravada como **JSONB** — assim o **objeto que o engine usa é preservado byte a byte** e **nenhuma fórmula muda**.

```sql
-- papéis do usuário (1:1 com auth.users do Supabase)
create table profiles (
  id uuid primary key references auth.users on delete cascade,
  email text,
  role text not null default 'user' check (role in ('super_admin','user')),
  active boolean not null default true,
  trial_expires_at timestamptz,          -- validade do acesso (revogação por expiração)
  created_at timestamptz default now()
);

-- oportunidades: o objeto do engine inteiro vai em `data` (jsonb) — zero mudança de schema por campo
create table opportunities (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users on delete cascade,
  data jsonb not null,                    -- == o objeto `o` que o motor já usa hoje
  updated_at timestamptz default now()
);

-- auditoria (append-only): a "licença master" lê isto
create table audit_events (
  id bigint generated always as identity primary key,
  user_id uuid references auth.users,
  event text not null,                    -- login, logout, opp_create, opp_update, opp_delete, view, denied
  detail jsonb,
  created_at timestamptz default now()
);
```

---

## 4. RLS — O CONTROLE REAL (no banco, não na tela)

```sql
alter table opportunities enable row level security;
alter table profiles      enable row level security;
alter table audit_events  enable row level security;

-- helper: o usuário é super_admin?
create or replace function is_admin() returns boolean language sql stable as $$
  select exists(select 1 from profiles p where p.id = auth.uid() and p.role='super_admin' and p.active);
$$;

-- OPORTUNIDADES: cada um só as suas; o admin vê todas
create policy opp_select on opportunities for select
  using ( user_id = auth.uid() or is_admin() );
create policy opp_write  on opportunities for all
  using ( user_id = auth.uid() )          -- ninguém escreve na linha de outro
  with check ( user_id = auth.uid() );

-- PROFILES: cada um vê o seu; o admin vê e gerencia todos
create policy prof_self  on profiles for select using ( id = auth.uid() or is_admin() );
create policy prof_admin on profiles for all   using ( is_admin() ) with check ( is_admin() );

-- AUDIT: só o admin lê; qualquer usuário autenticado insere seus eventos
create policy audit_admin_read on audit_events for select using ( is_admin() );
create policy audit_insert     on audit_events for insert with check ( user_id = auth.uid() );
```

Resultado: mesmo que a lançadora manipule a requisição HTTP, **o Postgres recusa** ler/escrever dado que não é dela. Isolamento não depende da interface.

> Nota sobre "read-only": o Davi quer que ela tenha a **experiência completa** (criar/editar as próprias oportunidades). Então ela **não** é read-only — é um usuário normal **confinado ao próprio espaço** por RLS. O controle que importa (não tocar dado de ninguém, não administrar) está garantido no banco. "Somente leitura" real fica como um papel futuro (`trial_viewer`), se um dia você quiser um convidado que só olha.

---

## 5. PAPÉIS

- **`super_admin` (Davi — a "licença master"):** vê **todos** os usuários, **todas** as oportunidades e o **log de atividade**; cria/desativa/expira usuários. É o painel master.
- **`user` (a lançadora):** plataforma **completa**, só no **seu próprio** espaço de dados.

---

## 6. FLUXO DE AUTENTICAÇÃO (recomendado: magic link)

Para o teste, **magic link (OTP por e-mail)** é o mais simples e seguro: sem senha para armazenar, vazar ou recuperar — ela digita o e-mail, recebe um link, entra. (Alternativa: e-mail+senha+MFA, se você preferir a UX clássica — o Supabase faz os dois.)

1. Página de login do LaunchOS (identidade visual atual) → campo e-mail → "Entrar".
2. Supabase envia o link; ela clica; sessão criada (JWT, expira automaticamente).
3. O app carrega **as oportunidades dela** do Supabase (ou, para o admin, o painel master).
4. Revogação: você desativa/expira o usuário no painel → próxima requisição falha, sessão morre.

---

## 7. PAINEL MASTER (o que você pediro)

Nova view **visível só para `super_admin`**:
- Lista de usuários (e-mail, papel, ativo, validade, último acesso).
- Por usuário: as oportunidades dele (abre em leitura).
- **Log de atividade** (quem entrou, quando, o que criou/editou).
- Ações: criar convite, desativar, expirar, revogar sessão.

---

## 8. O REFACTOR (preservando engine e features)

A única mudança no `app/index.html` é a **camada de persistência** — a matemática do motor **não é tocada**.

- **Hoje:** `load()` lê `localStorage` (síncrono); `save(opps)` grava `localStorage`.
- **Novo:** `load()` → `select` no Supabase das oportunidades do usuário; `save(o)` → `upsert` da linha `{user_id, data:o}`. Viram **assíncronos** (pequeno ajuste nos pontos de chamada; nenhuma fórmula muda).
- **Gate:** se não há sessão → mostra a tela de login em vez do app.
- **Papel:** o app lê `role`; `super_admin` ganha o item de menu do painel master. Nenhuma feature existente é removida.

Como o objeto da oportunidade vai inteiro no `jsonb`, **o engine recebe exatamente o mesmo `o` de hoje** — risco de regressão no cálculo ≈ zero.

---

## 9. HOSPEDAGEM

O `app/index.html` (+ libs de CDN que já usamos) sobe para **Cloudflare Pages** (ou Netlify). HTTPS automático. O app usa o **Supabase anon key** (é pública por design — a segurança vem da RLS, não do segredo da chave). Nada de segredo de servidor no cliente.

---

## 10. DIVISÃO DE EXECUÇÃO

- **Eu (sem precisar das suas chaves, preservando engine):** os arquivos SQL (schema + RLS acima), o módulo de dados (`supabase` client + `load/save` novos), a página de login, o painel master, o refactor dos pontos de chamada, e o runbook de deploy. Entrego para você plugar as chaves.
- **Você (só você consegue):** cria o projeto **Supabase** (free) e o **Cloudflare Pages** (free); roda o SQL; me passa a URL e a anon key (podem ir no código do cliente, não são segredo); convida a lançadora. **Sem deploy externo até validarmos os testes de segurança (Fase 4).**

---

## 11. FORA DE ESCOPO NESTE TESTE (explícito)

- **Proteção do IP contra o usuário autenticado** (motor/prompts ainda no cliente) — coberto por **NDA** agora; resolve-se movendo o motor para uma Edge Function depois, se necessário.
- **Multiempresa/multi-tenant avançado, billing, SSO corporativo** — fase de produto, não de teste.

---

## 12. ORDEM

1. Você aprova esta arquitetura.
2. Eu scaffoldo o código + SQL + runbook (engine intacto).
3. Você cria Supabase + Cloudflare Pages (free) e roda o SQL.
4. Plugamos as chaves, subimos para um ambiente de teste (não público ainda).
5. **Fase 4 — testes de segurança** (tentar escrever dado de outro usuário via API, elevar papel, burlar RLS, etc.) e correção.
6. Convite à lançadora. Revogável a qualquer momento.
