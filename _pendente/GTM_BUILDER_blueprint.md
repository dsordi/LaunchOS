# GTM Builder — blueprint do gerador profundo (intake → derivação → dossiê)

> **Status:** especificação para revisão (avança os artefatos pendentes 05 árvores de decisão + 08 requisitos). Ainda NÃO implementado no app.
> **Objetivo:** reunir **tudo que uma pessoa precisa para montar um GTM de lançamento aqui dentro**, de forma que o resultado seja **específico, rastreável e honesto** — não um playbook padrão gerado por texto.
> **Por que isto resolve o "genérico":** o gerador de hoje entrega o método (igual para todos). Aqui, o método vira **esqueleto**; o que o especializa são os **campos-alavanca** abaixo. Sem eles, qualquer gerador (com ou sem IA) preenche o vazio com prosa plausível.

---

## Três regras de design (inegociáveis)

1. **Todo campo é alavanca.** Só entra campo que **move um número ou um portão** de forma rastreável. Campo que só vira texto não entra. Régua: *"se eu mudar este valor, muda o veredito? dá pra ver como?"*
2. **Todo output carrega procedência.** Cada linha do dossiê traz **fonte (SRC/CON/MET/KPI) + marca de confiança (`[A]`/`[B]`/`[C]`/`[D]`/`[L]`) + se é observado ou estimado**. Projeção sempre recalculável.
3. **A ferramenta sinaliza o que não sabe.** Campo vazio ou premissa `[D]` **não é preenchido com chute confiante** — é marcado como lacuna no dossiê. Honestidade > completude.

---

## INTAKE — o que a pessoa preenche

### Bloco 0 · Oportunidade (E0)

| Campo | O que move / alimenta | Marca padrão | Portão |
|---|---|---|---|
| Nome da oportunidade | identificação na carteira | — | — |
| Expert/influenciador | diagnóstico E1, cruzamento com SRC-036 (quem a base já segue) e SRC-037 (ranking) | `[A]` input | — |
| Ideia do produto (do zero **ou** do portfólio) | base do Raio-X | `[A]` input | — |
| O que faz / para que serve / transformação | ângulo (E3), BrandScript | `[A]` input | — |
| **Categoria** (Profit add-on / InvestAcademy / outro) | liga compliance automático se tocar mercado financeiro | `[A]` input | **Compliance (E3/E7)** |
| **Flag renda variável** (sim/não) | bloqueio condicional de promessa publicitária | `[A]` input | **Compliance (DEC-010)** |
| Modelo de receita (assinatura: mensal/semestral/anual/bianual) | economia do funil (E5); **sem pagamento único** | `[A]` regra (DEC-014) | Viabilidade |
| Revenue share (1..N partes + % de cada) | split na cascata financeira | `[A]` input (DEC-012) | Viabilidade |

### Bloco 1 · Diagnóstico do expert/audiência (E1) — o que mais mata o "genérico"

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Redes + seguidores por rede | audiência bruta (teto de alcance) | `[A]` input | — |
| **Engajamento real por rede** (não seguidores) | audiência *efetiva* ponderada (SRC-034; evita vaidade) | `[A]`/`[D]` | E1 |
| Canal principal | cruza com FInfluence (engajamento por rede: YouTube líder) | `[A]` input | E6 (canais) |
| Tipo de conteúdo que já faz (educacional/análise/lifestyle) | alavanca de ângulo (FInfluence: didático engaja +158%) | `[A]` input | E3/E4 |
| Autoridade/reputação (certificação? histórico?) | diferencial (certificação é rara — SRC-037); risco reputacional | `[A]` input | E1 |
| Temperatura da relação (quente/morna/fria) | conversão esperada por fonte (GAP-012) | `[D]` | E5 |
| Já lançou antes? produto validado? | tipo de lançamento sugerido (HYP-002/005; dependências DEC-007) | `[A]` input | E4 |
| Concorrentes de atenção (outros experts que a audiência segue) | realismo da disputa (FInfluence: alcance diluindo) | `[A]`/`[C]` | E2 |

### Bloco 2 · Mercado endereçável — bottom-up (E2)

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Nicho (day trade futuros / ações / FIIs / educação geral) | **teto de mercado** pré-carregado da B3 (SRC-039) | `[A]` input | **E2 (barra TAM inflado)** |
| Teto do nicho (referência B3) | limite superior da projeção (ex.: futuros ~235 mil CPFs) | `[A]` SRC-039 | E2 |
| Audiência alcançável real (do expert) | base do cálculo (não TAM) | `[C]`/`[D]` | E2 |
| % de adesão estimada | conversão topo | `[D]` | E2 |
| → **Mercado endereçável** = alcançável × adesão × ticket | teto de receita potencial | derivado | E2 |

### Bloco 3 · Dor e ângulo (E3/E4) — o coração do específico

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Dor primária da audiência | pré-sugerida de SRC-035/036 (psicológico/tempo/conhecimento), editável | `[B]` | E3 |
| Transformação prometida | núcleo da oferta | `[A]` input | E3 |
| **Ângulo de campanha** | **DERIVADO**: educação/disciplina > promessa (SRC-037+13, `[B]`); sistema propõe, humano confirma | `[B]` derivado | E4 + Compliance |
| Nível de consciência da audiência | mensagem (Schwartz `[L]`, biblioteca/12) | `[L]` | E3 |
| **BrandScript** (herói, problema ext/int/filosófico, guia, plano, CTA, sucesso, fracasso) | copy do lançamento (StoryBrand, SRC-031) | `[A]`/`[C]` | E6 |
| Promessa (texto) | **passa pelo checklist de compliance** (termos proibidos SRC-035; renda variável; confusão aposta×investimento SRC-038) | — | **Compliance** |

### Bloco 4 · Modelo e estrutura de lançamento (E4)

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Tipo de lançamento (semente/interno/externo/perpétuo/relâmpago) | **sugerido** pelas dependências (DEC-007; HYP-005) | `[A]`/`[C]` | E4 |
| Formato(s) de comercialização (planos: meses, ticket/mês, mix %, churn período) | receita e cascata (DEC-021) | `[A]`/`[D]` | E5 |
| Janela (nº CPLs, dias de pré-lançamento, dias de carrinho) | cronograma (MET-001/Walker SRC-030) | `[A]` MET | E6 |
| Canais de aquisição (audiência quente / base Nelogica / tráfego pago) | CPL e conversão **por fonte** (GAP-012) | `[D]` | E5 |

### Bloco 5 · Economia do funil (E5) — go/no-go

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Investimento em mídia | custo de aquisição | `[A]` input | **Go/no-go** |
| CPL por fonte | nº de leads por canal | `[D]` (→`[A]` no piloto) | Go/no-go |
| Conversão por etapa (lead→CPL→carrinho→venda) | nº de vendas | `[D]` (→`[A]` no piloto) | Go/no-go |
| Custo base de leads Nelogica (R$1,60/lead) | custo + contribuição Nelogica | `[A]` regra (DEC-014) | Go/no-go |
| → **Cascata**: leads → vendas → bruto → cancelamentos (7d + multa 50%) → líquido → split → **CAC calculado** → payback → **caixa mês a mês** | veredito financeiro (GAP-011) | derivado | **Go/no-go** |
| Stress test (sensibilidade da conversão/CPL/ticket) | mostra **onde o plano quebra** | derivado | Go/no-go |

### Bloco 6 · Plano operacional (E6/E7)

| Campo | O que move | Marca | Portão |
|---|---|---|---|
| Cronograma (CPLs, abertura/fechamento carrinho, "24h finais") | playbook executável (MET-001) | `[A]` MET | E7 |
| Responsáveis (time) | execução/accountability | `[A]` input | E7 |
| Checklist de copy (guard-rails) | compliance ao vivo (termos proibidos + renda variável) | — | **Compliance** |
| Portões de aprovação humana | "o sistema propõe, o Davi decide" | — | Todos |

---

## DERIVAÇÃO — o que o sistema COMPUTA (não gera como prosa)

- **Audiência efetiva** = Σ(seguidores_rede × engajamento_rede) — não seguidores brutos.
- **Mercado endereçável** = (audiência alcançável × % adesão × ticket), **limitado pelo teto do nicho (B3)**. Se o input estourar o teto → alerta.
- **Ângulo sugerido** = f(dor primária, tipo de conteúdo do expert, engajamento por tema no FInfluence). **Regra dura:** se nicho = day trade e ângulo proposto = "ganho rápido/ficar rico" → sistema **alerta** (baixo engajamento + risco de compliance) e sugere pivot para educação/disciplina. Humano confirma.
- **Tipo de lançamento sugerido** = f(já lançou?, autoridade, produto validado?) via dependências DEC-007 / HYP-002 / HYP-005.
- **Funil financeiro** = cascata do Bloco 5, com CAC calculado (não estimado), payback e caixa mês a mês.
- **Go/no-go** = líquido após split vs. investimento, com faixa de sensibilidade (não número único).
- **Compliance gate** = se renda variável OU categoria Profit → checklist obrigatório + varredura de termos proibidos + alerta aposta×investimento.

---

## OUTPUT — o Dossiê GTM

1. Ficha da oportunidade (E0)
2. Diagnóstico do expert/audiência (E1) — audiência efetiva, não vaidade
3. Mercado endereçável bottom-up (E2) — com teto B3 e premissas
4. Ângulo + BrandScript (E3/E4)
5. Estrutura de lançamento (E4) — Walker **especializado** pelos inputs
6. Projeção financeira (E5) — cenários + caixa mês a mês + go/no-go + stress test
7. Playbook de execução (E6/E7) — cronograma + responsáveis + checklist de compliance
8. **Ledger de premissas e confiança** — cada afirmação com fonte + marca + observado/estimado
9. **"O que falta saber"** — lista explícita das lacunas `[D]` e dos campos não preenchidos

---

## Onde o INVESTIMENTO valida (o mapa que liga dinheiro a confiança)

Os campos marcados `[D]` são exatamente as hipóteses que um **lançamento piloto pago** converte em fato. É aqui que seu investimento vira "zona de segurança":

| Hipótese hoje `[D]` | O que o piloto produz | Vira |
|---|---|---|
| CPL por fonte | custo real por lead por canal | `[A]` |
| Conversão por etapa (lead→venda) | funil real observado | `[A]` |
| % de adesão da audiência | taxa real de compra | `[A]` |
| Churn por formato | cancelamento real (7d + multa) | `[A]` |
| Temperatura → conversão | diferença real quente × frio × base | `[A]`/`[B]` |
| Ângulo (educação × promessa) | qual converteu melhor no teste real | `[B]` |

> **É isto que tira o GTM de "genérico" e o leva à zona de segurança:** não é mais tela nem mais IA — é substituir cada `[D]` acima pelo número observado de **um** lançamento real. O blueprint já diz exatamente o que medir.

---

## O que NÃO entra agora (anti-vibecoding)

Biblioteca pesquisável, mais tipos de lançamento, IA generativa na tela, visão de carteira da lançadora inteira, landing. Tudo real, tudo depois. Construir agora = profundidade onde ainda não há uso.

---

## Próximo passo

Implementar o intake acima **bloco a bloco** no app, começando pelos que mais mudam o veredito (Bloco 1 diagnóstico + Bloco 2 mercado + Bloco 5 funil), com o **ledger de confiança** e o **"o que falta saber"** visíveis desde a primeira versão. O caso piloto preenche os `[D]` e fecha a validação.
