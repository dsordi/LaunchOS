# LaunchOS — Segurança & Acesso Externo · FASE 1: Diagnóstico Técnico

**Papel:** CTO / Engenharia de Segurança · **Data:** 2026-11-12 · **Escopo:** diagnóstico da arquitetura real antes de qualquer implementação de autenticação/autorização para acesso externo (Trial Viewer).

> **Regra preservada:** nada do algoritmo financeiro, features, tema ou motor foi alterado nesta fase. Isto é **apenas diagnóstico**.

---

## 0. VEREDITO EXECUTIVO (a verdade dura primeiro)

**No stack atual, a segurança que o documento pede é arquiteturalmente impossível — e a propriedade intelectual que se quer proteger já está 100% exposta hoje.**

LaunchOS **não é um SaaS**. É **um único arquivo HTML estático** (`app/index.html`, 4.120 linhas) com **todo o estado no `localStorage` do navegador**. Não há **backend, API, banco de dados, servidor, nem sistema de autenticação** — nada disso existe no projeto. Ele roda publicado como **Artifact do claude.ai** (página estática num iframe isolado, compartilhada como "qualquer um com o link").

Consequência direta, e é o ponto central:

- **Todo o código é entregue ao navegador do usuário.** O **algoritmo financeiro, as fórmulas, as regras de negócio e os prompts proprietários** (ex.: `buildPromptRoteiro`) estão em texto claro dentro do `index.html`. Qualquer pessoa com o link lê tudo com *Ver código-fonte* / DevTools. **A Seção 6 (proteger algoritmos, fórmulas, prompts) já está violada hoje**, antes de qualquer Trial Viewer.
- **Uma tela de login dentro desse mesmo arquivo não é segurança — é teatro.** O código é baixado *antes* de qualquer "login" rodar; o "login" é JavaScript que o próprio navegador executa e que qualquer um edita/pula. Isso é **exatamente o que a sua Regra Inegociável nº 4 proíbe** ("não confie em controles de interface; a validação deve ocorrer no backend"). Como **não existe backend**, não há onde validar.

Portanto, **como CTO eu me recuso a entregar um login de fachada no artifact e chamá-lo de segurança.** O que o documento pede exige uma mudança de arquitetura (Regra nº 3: "não substitua sem necessidade técnica comprovada" — a necessidade está provada abaixo). O caminho real está na Seção 5.

---

## 1. ARQUITETURA ATUAL (evidências do código)

| Camada | Realidade | Evidência |
|---|---|---|
| **Frontend** | HTML/CSS/JS vanilla, 1 arquivo, sem framework, sem build | `app/index.html` (4.120 linhas) |
| **Backend** | **Inexistente** | nenhum `package.json`, server, Dockerfile, função serverless; `find` não achou nada |
| **Banco de dados** | **Inexistente** | persistência = `localStorage.getItem/setItem(KEY)` (`launchos_opps_v2`), por navegador |
| **API / endpoints** | **Nenhum** | zero `fetch`/`XMLHttpRequest`/`WebSocket` próprios no código |
| **"Backend" de runtime** | Capabilities do Artifact: `claude.use('sample')` (copy por IA) e `claude.use('downloads')` (salvar arquivo) | `getCap()` linha 1683; só funcionam dentro do sandbox do claude.ai |
| **Hospedagem** | Artifact do claude.ai — página estática, iframe sandbox, link público | publicação via ferramenta de Artifact; compartilhado "anyone with the link" |
| **Autenticação** | **Nenhuma** | não há login, sessão, usuário, senha, token em lugar nenhum |
| **Autorização** | **Nenhuma** | não há papéis/permissões; toda função roda para quem abrir a página |
| **Dependências externas** | Chart.js 4.4.1 e PptxGenJS 3.12.0 via CDN jsDelivr (na allowlist de CSP) | linhas 177–178 |
| **Segredos** | **Nenhum embutido** (bom) — mas todo o IP está no fonte entregue | grep não achou chaves/tokens; prompts e motor estão em claro |
| **Gestão de env/secrets** | N/A (não há servidor) | — |
| **Isolamento de dados** | Nenhum: 1 `localStorage` por navegador; sem multiusuário | — |
| **Logs de auditoria** | Nenhum | — |
| **HTTPS / CSP / XSS** | Herdados do sandbox do claude.ai (não controláveis por nós, e **não** são controle de acesso) | — |

**O próprio README já reconhece:** *"Dados salvos localmente no navegador (localStorage) — versão com banco de dados é próximo passo."*

---

## 2. A INCOMPATIBILIDADE FUNDAMENTAL

O documento assume um SaaS cliente-servidor (backend valida, banco com RLS, APIs rejeitam escrita, sessões no servidor). **Nada disso existe.** Mapeando os requisitos contra o stack real:

| Requisito do documento | Possível no stack atual? | Por quê |
|---|---|---|
| Validação de autorização no backend (nº 4, Seç. 4.3) | ❌ **Não** | não há backend |
| Bloquear escrita por chamada direta à API (nº 7, Seç. 12) | ❌ **Não** | não há API; escrita = `localStorage` do próprio navegador, sempre gravável por DevTools |
| Read-only real para Trial Viewer | ❌ **Não** | só dá para esconder botões em JS (teatro); o dado é local e editável |
| Hash de senha, sessões, MFA, brute-force, rate limit (Seç. 4.1) | ❌ **Não** | exigem servidor/provedor de identidade |
| Isolamento de dados / RLS (Seç. 5) | ❌ **Não** | não há banco nem multiusuário |
| Proteger algoritmos/fórmulas/prompts (Seç. 6) | ❌ **Já violado hoje** | lógica roda no cliente; fonte é público |
| Logs de auditoria à prova de adulteração (Seç. 8) | ❌ **Não** | log no cliente é apagável pelo cliente |
| Revogação imediata de acesso (Seç. 11) | ❌ **Não** | não há sessão central para revogar |
| HTTPS, isolamento de iframe, CSP | ✅ Parcial | herdado do sandbox do claude.ai, não é controle de acesso |

**Conclusão:** o requisito nº 1 do próprio documento (backend valida tudo) não pode ser satisfeito porque a peça que o satisfaria não existe. Não é um detalhe a resolver — é a fundação que falta.

---

## 3. RISCOS PRIORITÁRIOS (ranqueados)

1. **CRÍTICO — Exposição total do IP (já ativa).** Motor financeiro, regras e prompts legíveis por qualquer um com o link. Um "Trial Viewer" com link = acesso ao fonte. **Nenhuma proteção client-side resolve.**
2. **CRÍTICO — Ilusão de segurança.** Publicar um login no artifact passaria a (falsa) sensação de acesso controlado a uma instituição financeira. É pior que não ter: cria responsabilidade sem proteção. 
3. **ALTO — Sem controle de escrita.** "Somente leitura" seria burlável trivialmente; qualquer avaliador técnico altera dados/estado.
4. **ALTO — Link público.** O artifact é compartilhado por link; não há como colocar autenticação na frente dele a partir daqui.
5. **MÉDIO — Sem auditoria/revogação.** Impossível saber o que a avaliadora acessou, ou cortar acesso de fato.
6. **BAIXO (positivo) — Sem segredos embutidos** e **sem chamadas de rede próprias**: a superfície de vazamento de credenciais é nula hoje (porque não há credenciais).

---

## 4. COMPONENTES QUE PRECISAM MUDAR

Para atender ao documento, **não** se "adiciona um login": migra-se o modelo de entrega.

- **Introduzir uma camada confiável (servidor/BaaS)** — hoje inexistente — que seja a dona da autenticação, autorização e dos dados.
- **Mover a lógica sensível para o servidor** (motor financeiro, prompts) para que o cliente **renderize**, não **contenha**, o IP. Sem isso, a Seção 6 permanece violada mesmo com login.
- **Transformar o `index.html` em cliente de uma API** (o HTML/JS atual vira o shell do app; passa a buscar dados e resultados do servidor em vez do `localStorage`).
- **Persistência em banco** com isolamento por usuário (RLS).

---

## 5. ARQUITETURA RECOMENDADA (prévia da Fase 2)

Dois problemas distintos — resolver na ordem:

### A) Controle de acesso (auth + RBAC + read-only + isolamento + auditoria + revogação)
Caminho pragmático e consolidado (Regra: usar solução pronta, não criptografia caseira): **Supabase** (Postgres + Auth + Row Level Security + Edge Functions) — ou equivalente (Auth0/Clerk + Postgres; ou Node/serverless + provedor de identidade).

- **Auth gerenciada:** hash de senha, sessões/JWT, reset de senha, MFA, rate limit, proteção a brute-force — tudo pronto e auditado, sem reinventar.
- **RBAC:** claim de papel no token → `SUPER_ADMIN`, `INTERNAL_USER`, `TRIAL_VIEWER`.
- **Trial Viewer read-only de verdade:** políticas de **RLS** no Postgres que **negam `INSERT/UPDATE/DELETE`** para o papel trial — a escrita é barrada **no banco**, não na interface. Burlar a UI não adianta.
- **Isolamento:** RLS por `user_id`/`workspace`; workspace de **demonstração** separado, com **dados fictícios** (nunca dados reais de clientes/parceiros).
- **Auditoria:** tabela de logs append-only (+ triggers) para login, falhas, tentativas de escrita negadas, eventos admin.
- **Revogação:** desabilitar usuário / expirar no provedor de identidade corta o acesso na hora.

### B) Proteção do IP (Seção 6) — o problema maior, já violado hoje
Mover **motor financeiro e prompts para o servidor** (Edge Function / API): o cliente envia inputs, recebe resultados; a fórmula nunca desce ao navegador. **Este é um refactor real** e é a única forma de cumprir a Seção 6. Pode ser faseado após (A), mas sem ele "proteger o algoritmo" continua não acontecendo.

> Minimalismo (Regra: sem complexidade desnecessária): **um** BaaS (Supabase) cobre auth + RBAC + RLS + logs + revogação sem múltiplos serviços. É a menor arquitetura que satisfaz os inegociáveis.

---

## 6. O QUE EU POSSO / NÃO POSSO FAZER DESTA SESSÃO (honestidade de execução)

- Esta sessão roda num **container cloud do claude.ai** com rede restrita e **sem acesso** às suas contas de hospedagem, domínio, Supabase/provedor de identidade ou segredos. **Não consigo** provisionar infra, subir banco/backend real, registrar provedor de auth, nem fazer deploy externo daqui — e o próprio documento manda **não** fazer deploy externo nesta fase (alinhado).
- **Com sua aprovação, posso** escrever no repositório a **arquitetura de referência como código**: schema + políticas RLS + migrations, funções/edge functions (incl. mover o motor), middleware de RBAC, esquema de auditoria, a página de login integrada e o refactor do cliente para consumir a API — mais a documentação da Fase 5. Isso é um **projeto de engenharia de semanas**, exige decisões suas (hospedagem, provedor, domínio, orçamento) e tratamento de segredos pelos canais corretos.

---

## 7. DECISÃO NECESSÁRIA ANTES DA FASE 3

Não avanço para implementação sem a decisão de arquitetura, porque a implementação honesta **muda o modelo de entrega** do produto. Opções:

- **(A) Fazer certo — backend real (Supabase):** a única via que cumpre os inegociáveis do documento. Projeto maior; eu scaffold tudo no repo, você provê contas/segredos, e validamos antes de qualquer exposição.
- **(B) Demo "soft" honestamente rotulada — NÃO é segurança:** um build separado, read-only na interface, com dados fictícios, para um avaliador **confiável** só olhar sem mexer por acidente. **Deixo explícito que não protege o IP** (fonte continua legível) e que um usuário técnico burla. Serve de conveniência, não de controle.
- **(C) Segurar a disponibilização externa** até (A) estar pronto.

Minha recomendação de CTO: **(C) agora + (A) como projeto**. Expor o produto a uma instituição financeira com (B) achando que é seguro é o pior dos mundos — responsabilidade sem proteção, e IP aberto.
