# LaunchOS — Como disponibilizar para o teste externo (passo a passo, linguagem simples)

Objetivo: colocar o LaunchOS no ar com **login por e-mail**, cada pessoa com seu próprio espaço, e um **painel master** só seu para ver o que cada usuário faz. **Custo: R$ 0.**

Você vai mexer em dois sites gratuitos: **Supabase** (login + banco de dados) e **Cloudflare Pages** (hospedar a página). Não precisa saber programar — é copiar, colar e clicar.

> Guarde as senhas dessas contas. Não compartilhe a chave "service_role" do Supabase com ninguém (ela é secreta; não vamos usá-la).

---

## PARTE 1 — Criar o banco e o login (Supabase) · ~10 min

1. Acesse **supabase.com** → **Start your project** → crie a conta (pode usar login do GitHub/Google).
2. Clique **New project**. Dê um nome (ex.: `launchos`), crie uma senha de banco (guarde) e escolha a região **South America (São Paulo)**. Clique **Create** e espere ~2 min.
3. No menu da esquerda, abra **SQL Editor** → **New query**. Abra o arquivo **`web/supabase-schema.sql`** deste projeto, **copie tudo**, cole na janela e clique **Run**. Deve aparecer "Success".
4. Deixe o login por e-mail ligado (já vem ligado). No menu **Authentication → Providers**, confirme que **Email** está habilitado.
5. **Convide as pessoas do teste:** menu **Authentication → Users → Invite user** → digite o **seu e-mail** e o **e-mail da lançadora**. (Opcional, mais seguro: em **Authentication → Providers → Email**, desligue "Allow new users to sign up" para que SÓ os convidados entrem.)
6. Pegue as duas informações que o site precisa: menu **Project Settings → API**. Copie:
   - **Project URL** (algo como `https://xxxx.supabase.co`)
   - **anon public** (uma chave longa) — essa é pública, pode usar.

Guarde esses dois valores para a Parte 2.

---

## PARTE 2 — Colocar a página no ar (Cloudflare Pages) · ~10 min

1. No projeto, dentro da pasta **`web/`**, copie o arquivo **`config.example.js`** para um novo arquivo chamado **`config.js`** e cole ali os dois valores da Parte 1 (a URL e a anon public).
2. Junte numa pasta só, para subir: **`index.html`** (que está em `app/index.html`) + o seu **`config.js`**.
3. Acesse **pages.cloudflare.com** → crie a conta gratuita.
4. **Create a project → Upload assets** (upload direto, sem precisar de GitHub). Arraste os dois arquivos (`index.html` e `config.js`) e publique.
5. Em ~1 min a Cloudflare te dá um endereço (ex.: `https://launchos.pages.dev`). Esse é o link do app.

> Importante: **não divulgue esse link ainda.** Primeiro a gente valida a segurança (Parte 4).

---

## PARTE 3 — Virar o administrador master · 2 min

1. Abra o link da Cloudflare, entre com o **seu e-mail** → você recebe um **link de acesso por e-mail** → clique nele → entrou.
2. Volte ao Supabase → **SQL Editor** → rode (troque pelo seu e-mail):
   ```sql
   update public.profiles set role = 'super_admin' where email = 'SEU-EMAIL@exemplo.com';
   ```
3. Recarregue o app: agora aparece o botão **"Painel master"** (canto inferior direito) — lá você vê os usuários, quantas oportunidades cada um tem e o registro de atividade.

---

## PARTE 4 — Antes de liberar para a lançadora (segurança)

Me avise quando as Partes 1–3 estiverem feitas. Eu rodo os **testes de segurança (Fase 4)**: confirmar que ela não consegue ver/alterar dado de outro usuário nem virar admin, mesmo tentando burlar. Só depois disso você manda o link + o NDA para ela.

---

## Operação do dia a dia

- **Convidar alguém:** Supabase → Authentication → Users → Invite user.
- **Revogar na hora:** Supabase → SQL Editor →
  `update public.profiles set active = false where email = 'pessoa@exemplo.com';`
  (o acesso dela morre na próxima ação).
- **Ver atividade:** botão "Painel master" no app.

## Dúvidas comuns

- *"O Supabase pausou o projeto"*: o plano grátis pausa após ~1 semana **sem acesso**. É só abrir o painel do Supabase e clicar em "Restore" — volta na hora. Num teste ativo isso não acontece.
- *"Mudei o app, e agora?"*: quando eu publicar uma nova versão do `index.html`, você sobe o arquivo novo na Cloudflare (Parte 2, passo 4). Seu `config.js` continua o mesmo.
