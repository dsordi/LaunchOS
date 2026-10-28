# Artefato F — Catálogo de Indicadores, Definições e Fórmulas

> Regra dura (projeto, seção 5.8): separar **fórmula matemática** (sempre válida), **exemplo numérico** (premissa de um caso) e **benchmark** (média sustentada por dado). A maioria dos "números" deste mercado é exemplo ou alegação, **não** benchmark.
> Legenda confiança: **[A-fórmula]** definição matemática · **[A-bench]** benchmark com fonte/data real · **[D-exemplo]** número de exemplo, não generalizável · **[D-alegação]** número autodeclarado sem auditoria.

## Indicadores com fórmula definida (válidos sempre)

| ID | Indicador | Fórmula | Momento | Decisão que apoia | Fonte | Confiança |
|----|-----------|---------|---------|-------------------|-------|-----------|
| KPI-001 | CPL (custo por lead) | verba de captação ÷ nº de leads | Captação | Público saturado? criativo cansado? | SRC-001 | [A-fórmula] |
| KPI-002 | Conversão da lista | vendas ÷ nº de leads | Carrinho | Qualidade do aquecimento e da lista | SRC-001 | [A-fórmula] |
| KPI-003 | ROAS | faturamento ÷ verba de mídia | Pós | Retorno do investimento em anúncio | SRC-001 | [A-fórmula] |
| KPI-004 | CAC | verba investida ÷ nº de clientes | Pós | Custo de aquisição; viabilidade | SRC-001, SRC-007(menção) | [A-fórmula] |
| KPI-005 | Ticket médio | receita ÷ nº de vendas (com esteira) | Carrinho/Pós | Impacto de order bump/upsell | SRC-001 | [A-fórmula] |
| KPI-006 | Taxa de presença (webinar) | presentes ÷ inscritos | Aquecimento | Termômetro do carrinho | SRC-001 | [A-fórmula] |
| KPI-007 | Taxa de abertura / clique (e-mail) | aberturas(ou cliques) ÷ enviados | Todas | Saúde da comunicação | SRC-001 | [A-fórmula] |
| KPI-008 | Taxa de reembolso | reembolsos ÷ vendas | Pós (pós-garantia) | Qualidade real da entrega; lucro efetivo | SRC-001(menção) | [A-fórmula] |
| KPI-009 | Taxa de abandono de checkout | abandonos ÷ iniciados | Carrinho | Quanto a recuperação pode devolver | SRC-001 | [A-fórmula] |

## Benchmarks externos reais (com fonte e data) — usar como ordem de grandeza

> **Atenção:** todos são de contexto **não-infoproduto** (B2B, e-commerce geral). Não são benchmark de lançamento de infoproduto. Servem para calibrar expectativa, nunca como meta ou promessa.

| ID | Métrica | Valor | Fonte / data | Ressalva |
|----|---------|-------|--------------|----------|
| KPI-B01 | Abertura de e-mail (geral) | ~35,6% | Mailchimp, dez/2023 | **Inflada** pós-Apple Mail Privacy (2021); clique (2,62%) é mais confiável |
| KPI-B02 | Clique de e-mail (geral) | 2,62% | Mailchimp, dez/2023 | Métrica mais confiável que abertura |
| KPI-B03 | Presença em webinar ao vivo | 57% dos inscritos | ON24, 2025 (dados 2024) | **Contexto B2B**, não infoproduto |
| KPI-B04 | Abandono de carrinho | 70,22% | Baymard Institute, set/2025 (50 estudos) | **E-commerce geral**, não infoproduto |
| KPI-B05 | Ganho de conversão com melhor checkout | ~+35% | Baymard | E-commerce; ordem de grandeza |

## Números de EXEMPLO (premissas de caso, NÃO benchmark)

> Do exemplo trabalhado da HeroSpark (SRC-001). São **premissas declaradas para ilustrar a conta**, explicitamente não são médias de mercado. Reproduzidos para mostrar a *estrutura* do cálculo, não os valores.

| ID | Variável | Valor no exemplo | Natureza |
|----|----------|------------------|----------|
| KPI-E01 | Verba de captação | R$10.000 | premissa [D-exemplo] |
| KPI-E02 | CPL | R$5,00 | premissa [D-exemplo] |
| KPI-E03 | Leads gerados | 2.000 | derivado das premissas |
| KPI-E04 | Conversão da lista | 3% | **premissa, não benchmark** [D-exemplo] |
| KPI-E05 | Vendas | 60 | derivado |
| KPI-E06 | Ticket | R$1.997 | premissa |
| KPI-E07 | Faturamento bruto | R$119.820 | derivado |
| KPI-E08 | ROAS resultante | 11,98 | derivado |
| KPI-E09 | CAC resultante | R$166,67 | derivado |

**Uso correto:** a *estrutura* (verba→CPL→leads→conversão→vendas→bruto→ROAS/CAC) é um modelo de projeção reutilizável. Os *valores* são de um caso inventado. No SaaS, isto vira uma **calculadora com premissas editáveis**, nunca valores default apresentados como esperados.

## Números de ALEGAÇÃO (autodeclarados, sem auditoria) — não usar para nada quantitativo

| Métrica | Valor | Fonte | Por que desconfiar |
|---------|-------|-------|---------------------|
| Conversão de página de captura | 42–50% | Alex Vargas, SRC-013 | Alegação própria, 2016, single-source, não verificável |
| "6 em 7" | R$100k+/7d | vários | É **meta/receita bruta**, não resultado típico nem lucro |
| 1º lançamento de Érico | R$100k *ou* R$1mi | SRC-007 vs SRC-015 | Fontes divergem 10x; material promocional |
| Trajetória Marcos Paulo | R$3k→R$9,4mi→+R$300mi | SRC-014 | Autodeclarado pelo perfilado |
| Faturamento Gabi Salles / Micha | R$110mi / R$15mi | SRC-008 | Autodeclarado em live comercial |

## A distinção que o projeto exige (faturamento × caixa × lucro × margem)

**[B] convergente e central** (SRC-002, SRC-008 explícitos): "6 em 7" e todo "faturamento de lançamento" é **receita bruta**. Para chegar ao que sobra:

```
Receita bruta (vendas × ticket)
 − reembolsos/cancelamentos (dentro da garantia, ex. 30 dias)
 − taxa da plataforma (ex. 3,9%–9,9% + fixo por venda, varia muito)
 − verba de tráfego
 − comissão de afiliados (no externo)
 − custo de produção/entrega do produto
 − ferramentas e serviços
 − impostos
 − divisão entre sócios / revenue share (ex.: expert × lançador × infra)
 = lucro efetivo
```

**Implicações para o caso do Davi (revenue share Roxo/Delboni):** a linha "divisão entre sócios" **não é resíduo** — é estrutural. Num modelo de 3 partes (expert, lançador, Nelogica), o break-even e a margem de cada parte dependem do split **antes** de qualquer projeção fazer sentido. Isto é GAP-004 e precisa dos números internos reais.

> **Recebimento de caixa ≠ faturamento:** nenhuma fonte trata do descasamento temporal (parcelamento, prazo de repasse da plataforma, chargeback). Lacuna a registrar — relevante para fluxo de caixa de quem opera o lançamento.
