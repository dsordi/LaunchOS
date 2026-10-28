# Artefato I — Lacunas de Conhecimento e Hipóteses Pendentes

> Registro vivo. Semeado na Fase 0 com o que já é possível afirmar sem fonte externa.
> Lacuna (`GAP`) = algo que falta saber. Hipótese (`HYP`) = algo afirmado que precisa de prova.

## Lacunas (GAP)

| ID | Lacuna | Por que importa | Decisão prejudicada | Fonte adequada para fechar | Impede funcionalidade? |
|----|--------|-----------------|---------------------|-----------------------------|------------------------|
| GAP-001 | Viés comercial da literatura de lançamento | A maioria das fontes vende o próprio método; distorce o que parece "comprovado" | Qualquer recomendação baseada em autoridade do autor | Dados primários, cases auditáveis de terceiros, acadêmico | Não impede; reduz confiança de toda regra derivada de autor |
| GAP-002 | Benchmarks numéricos reais (conversão, CAC, reembolso por etapa) | Sem números, projeção financeira vira chute | Viabilidade, meta, orçamento, go/no-go | Dados de operações reais (inclusive da própria Nelogica) | **Parcialmente fechado (2026-10-28):** SRC-035/036 trazem **ticket (R$76–148/mês), tempo de vida (faixa 3,6–20 meses), assinatura Profit Pro (28–71%) e NPS** reais da base Nelogica (ver `13`). Mas são **datados, de base de clientes (≠ audiência de lançamento) e sem CAC/conversão de lançamento nem reembolso por etapa**. Projeção de lançamento ainda não tem benchmark próprio |
| GAP-003 | Regulação de publicidade em renda variável | Caso específico do Davi: lançamentos tocam mercado financeiro | Copy, oferta, promessa, compliance | CVM, normas de publicidade, jurídico Nelogica | Impede liberar copy; é bloqueio, não ajuste fino |
| GAP-004 | Economia unitária do modelo revenue share | Modelo Roxo/Delboni é RS entre expert, lançador e Nelogica; divisão muda o break-even | Quanto a Nelogica aceita investir e a que preço | Dados internos + contrato | Impede dimensionar o deal; não impede a metodologia geral |
| GAP-005 | Diferença audiência × engajamento × intenção de compra | Audiência grande não significa compra; erro comum de diagnóstico | Avaliar prontidão do influenciador para lançar | Dados de venda vs. métricas de vaidade | Não impede; é núcleo do módulo de diagnóstico |

## Lacunas descobertas na análise das fontes (Fase 1-2)

| ID | Lacuna | Por que importa | Fonte adequada para fechar | Impede funcionalidade? |
|----|--------|-----------------|-----------------------------|------------------------|
| GAP-006 | Copywriting com profundidade (fórmulas, estrutura de VSL/carta, sequência de e-mail) | É metade da conversão; o corpus só dá estrutura rasa (SRC-012) ou genérica | Fontes especializadas em copy (Gugelmin, Schwartz, Hopkins); material do próprio mercado | **Parcialmente coberto por `[L]`** em `biblioteca/12` (Schwartz, Hopkins, Ogilvy, Halbert/Sugarman) — mas é conhecimento do modelo, **não leitura auditada**. Fecha de verdade só com os textos (upgrade para `[A]`) |
| GAP-007 | Perspectiva crítica de agência de performance | V4 (SRC-006) bloqueou; falta o contraponto de quem critica a FL por fora do ecossistema de infoproduto | Reenvio da V4; outras agências de performance | Não impede; empobrece o equilíbrio crítico |
| GAP-008 | Descasamento temporal faturamento × caixa | Nenhuma fonte trata de parcelamento, prazo de repasse, chargeback | Dados de plataforma (Hotmart/Kiwify) e financeiro interno | Impede projeção de fluxo de caixa (distinta de faturamento) |
| GAP-009 | Capacidade de entrega e suporte pós-venda | Fontes focam em vender, quase nada em entregar/reter; reembolso mal tratado | Dados de retenção/reembolso reais; literatura de customer success | Afeta módulo de sustentabilidade pós-lançamento |
| GAP-010 | Transferibilidade de GTM B2B → lançamento B2C de infoproduto | SRC-018 traz um funil B2B forte (sinais de intenção, AEO, fidelização), mas B2B ≠ B2C; aplicar sem adaptação é erro | Dados/casos de aquisição em infoproduto; teste real | Não impede; limita o uso direto do material de SRC-018 |
| GAP-011 | Fluxo de caixa no tempo em modelo de assinatura + revenue share | Gasta-se tráfego hoje e recebe-se a assinatura ao longo de meses; dá para ser "lucrativo no papel" e morrer de caixa. Estende GAP-008 para o caso real da Nelogica (recorrência + RS) | Dados reais de recebimento/repasse + modelo de caixa mês a mês | Impede dizer quando a lançadora recupera o investido; v0.3 só calcula payback aproximado |
| GAP-012 | CPL e conversão variam por fonte/canal e por escala | v0.3 agrega audiência quente, tráfego pago e base Nelogica (fria) numa conversão/CPL só; cada fonte converte diferente e o CPL degrada ao escalar (crítica de tráfego, [C]) | Dados reais por canal (Meta/Google/YouTube) e por temperatura | Não impede; infla/esvazia a projeção se as fontes forem muito distintas |
| GAP-013 | Economia da própria lançadora (portfólio, capacidade, P&L da agência) | O decisor avalia 1 lançamento; uma lançadora é carteira de experts/lançamentos com capital comprometido, margem combinada, capacidade finita e custos fixos próprios | Dados operacionais reais da lançadora quando existir | Não impede o decisor; é a camada que falta para "estruturar uma lançadora" |

## Hipóteses (HYP)

| ID | Hipótese | Origem | O que a validaria | Status |
|----|----------|--------|-------------------|--------|
| HYP-001 | Existe um "modelo de lançamento ideal" por perfil de operação | Pressuposto comum do mercado | Evidência de que o mesmo perfil ganha mais com modelo X que Y, controlando variáveis | **Parcialmente refutada.** SRC-001 afirma que o que define faturamento é oferta+aquecimento+audiência, não o tipo. O tipo define esforço/verba/alcance, não um teto. A ideia de "modelo ideal" por perfil é simplista demais |
| HYP-002 | Produto validado previamente reduz risco do lançamento | Senso comum do setor | Comparar lançamento de produto novo vs. já vendido na mesma operação | **Reforçada [B].** Convergência: externo "só depois de interno validado" (SRC-005/008); afiliado não valida, escala produto validado (SRC-001). Lógica de dependência é consistente entre fontes |
| HYP-003 | O primeiro lançamento raramente atinge a meta ("6 em 7") | SRC-008 (Érico: "leva 3-7 lançamentos"); SRC-017 (praticantes: tentativa-e-erro) | Dado longitudinal de operações reais | **Reforçada [B].** Até o criador do método admite. Contraponto direto à promessa de venda |
| HYP-004 | Para iniciante sem produto, semente é o ponto de entrada de menor risco | SRC-001 e maioria | — | Sustentada pela maioria, mas **contestada** por SRC-008 (debate Hotmart: perpétuo mais seguro p/ iniciante). Divergência real; resposta depende do perfil |
| HYP-005 | Para expert com autoridade e audiência já estabelecidas, o ponto de entrada NÃO é o semente | Inferência [C] a partir da lógica de pré-requisitos | Testar com operações reais da Nelogica (ex. Roxo/Delboni) | Não testada; é a hipótese mais relevante para o caso do Davi |
| HYP-006 | "Ser citável por IA" (AEO) + conteúdo aberto é canal de awareness relevante também para lançamento B2C de infoproduto | SRC-018 (origem independente B2B) | Medir se tráfego/leads vindos de respostas de IA crescem e convertem num lançamento real | **Não validada.** Conceito novo vs. corpus; plausível, mas vem de contexto B2B. Não virar regra sem dado |

| HYP-007 | A dor central do público Nelogica é psicológico/gestão emocional + tempo + conhecimento (não "como ficar rico") | SRC-035/036 (dado interno): "maior desafio = controle psicológico" convergente em todos os perfis; "ganho rápido" sempre marginal (1,5–3,2%) | Testar se oferta/ângulo mirando disciplina/gestão emocional converte melhor que promessa de ganho, num lançamento real | **Reforçada [B] interno.** Convergência entre perfis e entre os dois estudos. Vale para a base atual; validar na audiência de lançamento (prospect frio) |
| HYP-008 | Experts que a base Nelogica já segue (Stormer, Claudinho Trader, Felipe Amorim…) têm custo de aquecimento menor como parceiros de lançamento | SRC-036 (lista de influenciadores seguidos) + lógica de audiência pré-existente [C] | Comparar aquecimento/conversão de lançamento com expert reconhecido pela base vs. desconhecido | **Não validada.** Frequência autodeclarada em amostra de 340; não é força comercial comprovada. Insumo para E0/E1, não regra |

> As entradas de hipótese nascem agora **confrontadas com as fontes** (Fase 1-2), não só de raciocínio a priori. Marcações [B]/[C] indicam o nível de sustentação.
