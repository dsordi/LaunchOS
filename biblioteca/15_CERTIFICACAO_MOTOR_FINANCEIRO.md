# Artefato O — Certificação do motor financeiro (board-grade)

> **Propósito:** documento de apoio para apresentação a board. Registra, com transparência total, **o que o LaunchOS calcula, como, com que confiança, e o que deliberadamente não calcula**. Um board de nível institucional avalia a metodologia tanto quanto o número — e a força deste sistema é ser **honesto sobre a própria confiança**.
> **Auditoria:** 2026-10-28, contra o **código real** do app (harness determinístico em Node/vm, não cópia). Decisão: DEC-026 em `10`.

---

## 1. Regra de ouro (dizer isto ao board, primeiro)

Todo número aqui é de uma de duas naturezas, sempre marcada na tela:
- **Observado** (`[A]`/`[B]`) — dado real: tetos de mercado da B3, ticket/vida da base Nelogica, fórmulas de contabilidade.
- **Premissa** (`[D]`) — hipótese editável e **recalculável**, sobretudo a **conversão** do funil. Não há benchmark público auditável de conversão de lançamento (GAP-002); por isso a projeção é **estrutura reproduzível, não previsão**.

**O sistema propõe; o humano decide.** Nenhum número vem de texto de IA — o cálculo é 100% determinístico (mesma entrada → mesma saída).

---

## 2. As fórmulas (todas verificadas)

**Funil (cascata), por cenário:**
```
audiência alcançável = Σ seguidores × taxa de alcance%
leads = (alcançável × opt-in%) + (verba de mídia ÷ CPL) + leads da base Nelogica
vendas = leads × conversão%
clientes efetivos = vendas × (1 − cancelam em 7 dias%)
receita contratada = efetivos × receita/cliente         ← ao longo do TERMO (12–24 m), não caixa do lançamento
lucro operacional = receita − taxa plataforma − custos fixos − custo base de leads − imposto
```

**Receita por cliente (modelo A de churn — DEC-021):**
```
por formato: valor do período × (1 − churn%_período × (1 − multa%))
receita/cliente = média dos formatos ponderada pelo mix
```
→ quem completa paga 100% do período; **quem churna contribui com a multa (ex.: 50%) sobre o valor TOTAL do período** — simplificação deliberada: não sobre o saldo restante e sem supor quando cancela. *(Nota: a regra de negócio original fala em "50% do valor restante"; o modelo usa valor total do período como aproximação conservadora/estável. Refinar para base temporal é melhoria mapeada.)*

**Unit economics:**
```
CAC (calculado, não estimado) = (verba de mídia + custo da base Nelogica) ÷ clientes efetivos
margem de contribuição/cliente = receita/cliente × (1 − taxa plataforma% − imposto s/ receita%)
LTV:CAC = margem de contribuição/cliente ÷ CAC        ← MARGEM, não receita bruta
payback (meses) = CAC ÷ margem mensal por cliente
```

**Split / revenue share (1..N partes):**
```
base = lucro (ou receita, se escolhido)
repasse de cada parte = (base − recuperação) × (pct da parte ÷ Σ pct)   ← normalizado: conserva o total
operador recebe o residual (+ recuperação de investimento; − custos, se split sobre receita)
```

**Mercado endereçável (bottom-up — E2):**
```
clientes potenciais = audiência alcançável × adesão%, LIMITADO pelo teto real do nicho (B3)
valor de contrato potencial = clientes potenciais × receita/cliente       ← topo; não é caixa nem lucro
```
Tetos (B3, 2T2026 — SRC-039): day-trade/futuros ~235,8 mil CPFs · ações ~4,3 mi · RV total ~5,7 mi · FIIs ~3,4 mi.

**Recuperação do investimento em caixa (DEC-027):**
```
aporte Nelogica = mídia + produção + ferramentas + outros + custo da base de leads   (caixa adiantado)
caixa do mês m = receitas que entram no mês m × (1 − taxa plataforma% − imposto s/ receita%)
  · PIX     → valor integral do período no mês 0 (≈ D+1)
  · cartão  → parcela k no mês k (D+30 × k), ou antecipado no mês 0 (− taxa de antecipação)
tempo de recuperação = mês em que o caixa acumulado ≥ aporte   (interpolado p/ meses fracionários)
```
→ a Nelogica **recupera o aporte antes de qualquer split**; o repasse ao influenciador só começa depois. É uma **fatia** do fluxo de caixa no tempo (GAP-011), não o fluxo completo (não projeta o caixa após a recuperação nem o timing de reembolso de churn). Premissa-chave: **PIX à vista = valor integral do período pago de uma vez**.

**Veredito go/no-go (E5):**
```
VIÁVEL  se operador ≥ 0 no cenário conservador
NO-GO   se operador < 0 até no cenário otimista
TESTAR  se troca de sinal entre os dois (depende de premissa não validada)
break-even = conversão em que o OPERADOR zera (bisseção numérica)
```

---

## 3. O que foi auditado e verificado (✓)

| Teste | Resultado |
|---|---|
| Aritmética da cascata (ex.: receita/cliente R$2.300,10; ticket R$259; CAC R$162,04) | ✓ exato |
| Identidade: lucro = receita − custos − imposto | ✓ |
| **Conservação do split**: Σ repasses == lucro, nas duas bases, para qualquer soma de % | ✓ (após F1) |
| Linearidade do lucro na conversão | ✓ |
| **Break-even do operador** zera o operador (inclusive com recuperação de investimento) | ✓ (após F4, bisseção) |
| **LTV:CAC de margem** < LTV:CAC bruto (11,4x vs 14,2x no exemplo) | ✓ (após F2) |
| Casos-limite: CPL=0, conversão=0, plano legado, mix zerado, sem redes | ✓ sem quebra |

Correções aplicadas nesta auditoria (DEC-026): **F1** normalização do split + alerta; **F2** LTV:CAC por margem de contribuição; **F4** break-even do operador por bisseção; **F3/F5** rótulos precisos de churn e de "receita contratada".

---

## 4. Simplificações documentadas (dizer ao board, não esconder)

1. **Churn/multa** sobre o valor total do período, não o saldo restante (DEC-021). Aproximação estável; refino temporal mapeado.
2. **Cenários** (conservador/otimista) flexionam **só a conversão**. É uma análise de sensibilidade de uma variável — a de maior incerteza. Flexionar churn/CPL juntos é melhoria mapeada.
3. **Payback** usa margem mensal bruta e não desconta churn no tempo — otimista por construção; ler junto com a fidelidade.
4. **CAC** é de aquisição paga (mídia + base), não totalmente carregado (não rateia produção/ferramentas). Rotulado como tal.

---

## 5. Lacunas honestas (o que falta para virar veredito calibrado)

- **GAP-011 — Fluxo de caixa no tempo (parcialmente coberto).** Já modelamos o **tempo de recuperação do aporte** em caixa (PIX à vista × cartão parcelado/antecipado — DEC-027). **Falta** o fluxo de caixa completo pós-recuperação (entradas e saídas mês a mês até o fim dos contratos) e o timing de reembolso de churn. Em assinatura + revenue share ainda dá para ser "lucrativo no papel" e ter aperto de caixa no meio — o fluxo completo é a próxima camada.
- **GAP-002 — Benchmark de conversão.** A conversão lead→venda é `[D]`. Nenhuma fonte pública a sustenta. **Só um lançamento piloto a converte de `[D]` para `[A]`** — é exatamente o que o investimento valida.
- **Caso piloto real** ainda não definido (candidato: Roxo/Delboni). Sem ele, o Decisor é bem fundamentado, não calibrado.

---

## 6. Como posicionar isto num board

Não vender como "previsão de faturamento". Vender como **o que é**: um decisor que (a) ancora o mercado no teto real da B3, (b) usa o ticket/vida reais da base Nelogica, (c) calcula CAC e LTV:CAC de margem de forma determinística, (d) **barra** lançamentos no cenário conservador, e (e) **declara explicitamente** cada premissa e cada lacuna. A credibilidade vem de **não prometer o que não se pode provar** — o oposto das métricas infladas do mercado de lançamento.
