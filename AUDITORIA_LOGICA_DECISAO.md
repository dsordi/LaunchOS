# LaunchOS — Auditoria Crítica da Lógica de Decisão

> **Objetivo:** verificar se o núcleo decisório descrito em `LAUNCHOS_PRODUCT_BLUEPRINT.md` consegue transformar uma oportunidade em uma decisão **defensável e reproduzível**, sem número inventado nem interpretação arbitrária da IA. **Não é implementação.** Não altera o blueprint nem a base — toda mudança aparece como **proposta**.
> **Data:** 2026-10-28 · **Marcas:** `[A]` fato de fonte · `[B]` convergência independente · `[C]` inferência · `[D]` hipótese.
> **Aviso sobre números:** todos os valores nos testes são **fictícios, marcados `[D]`**, criados só para estressar as regras. **Nenhum é benchmark.** Alíquotas de imposto são hipóteses de trabalho, **não** alíquotas reais — definir com contador.

---

## 0. Veredito em uma linha (para quem tem pressa)

**O núcleo decisório AINDA NÃO está suficientemente especificado para implementar o motor financeiro (E5).** A *direção* da lógica é sólida e defensável; mas o motor tem **pelo menos 5 ambiguidades que alteram o resultado em dinheiro** — a pior delas (base do split) pode fazer um lançamento "lucrativo" pagar sócios **acima do lucro existente**. A casca do produto (E0/E1/E4 + biblioteca) é segura para construir; **E5 não é**, até resolver as decisões humanas da §3 e consultar um contador. Detalhe e provas abaixo.

---

## 1. Inconsistências encontradas

Ordenadas por gravidade (impacto no resultado em dinheiro).

### INC-1 — Base de incidência do split é indefinida: receita OU lucro? **(crítica)**
O blueprint fala em "revenue share" e em "margem por parte", mas **não define sobre o que o split incide**. "Revenue share" literalmente é sobre *receita*; o catálogo de indicadores (`06`) desenha o split no **fim** da cascata ("− divisão entre sócios = lucro"), o que sugere *lucro*. São coisas opostas.
- Se o split é **% da receita**, os sócios podem receber **mais do que o lucro que existe**, jogando a parte residual (a Nelogica, no desenho) para o prejuízo. Provado no **Cenário 4**.
- Impacto: a atratividade do negócio muda até **3×** para a mesma operação, só trocando a base. Isto não é detalhe de implementação — é a regra mais perigosa do sistema.
- Fonte: **nenhuma**. O corpus não trata disso (GAP-004). É **decisão humana + regra operacional a definir**.

### INC-2 — Recuperação de investimento inicial no split não está especificada **(crítica)**
Quem banca a verba de tráfego adiantada (ex.: a Nelogica) **recupera esse valor "por cima" antes do split, ou não?** O blueprint não diz. A ordem da cascata (recuperar primeiro vs. dividir direto) muda quanto cada parte leva. Provado no **Cenário 4**. Fonte: nenhuma → decisão humana.

### INC-3 — Base da comissão de afiliado indefinida (bruto vs. líquido de reembolso) **(alta)**
A comissão incide sobre o **valor bruto da venda** ou sobre a **receita após cancelamentos**? O blueprint lista "− comissão de afiliados" sem base. No **Cenário 2**, a mesma oportunidade dá **−R$10.800 (prejuízo)** ou **+R$32.400 (lucro)** dependendo só dessa escolha. Fonte: nenhuma → regra operacional a definir.

### INC-4 — Base de incidência dos impostos indefinida **(alta)**
"− impostos" aparece sem base. Imposto sobre **faturamento** (regime tipo Simples/Presumido) e imposto sobre **lucro** têm bases completamente diferentes e mudam o resultado. Além disso, a alíquota depende do **regime tributário real** da operação — que o sistema não pode adivinhar. Fonte: nenhuma no corpus → **exige input de contador**; é lacuna + decisão humana.

### INC-5 — Ordem e reversão da taxa de plataforma não especificadas **(média)**
A taxa (ex.: Hotmart) incide por venda (sobre o bruto) e normalmente é **estornada no reembolso**. O blueprint trata "− taxa de plataforma" como uma linha única, sem dizer a base nem o que acontece no estorno. Afeta o número, embora menos que INC-1/3. Fonte: parcial (SRC-001 cita faixa 3,9%–9,9%) → regra operacional a definir.

### INC-6 — Conversão colapsada em um único passo (mistura audiência com lista) **(média)**
E2 dimensiona por "audiência alcançável × conversão × ticket", mas o KPI de conversão (`06`, KPI-002) é **vendas ÷ leads** — base **lista**, não audiência. Entre audiência e venda há **dois** funis (audiência→lead, via opt-in/CPL; e lead→venda). Colapsar em uma "conversão" só confunde as bases e infla ou esvazia o dimensionamento. É exatamente o GAP-005 (audiência ≠ lista ≠ intenção) aparecendo como erro de fórmula. Fonte do problema: `06`/`09` → regra operacional a corrigir.

### INC-7 — Reembolso tratado como pontual; o lucro no fechamento é provisório **(média)**
Reembolso ocorre **dentro da garantia (ex.: 30 dias)**. Logo, o "lucro" calculado no fechamento do carrinho é **pré-garantia** — provisório. O blueprint não marca isso nem prevê **provisão/reserva** para reembolso futuro. Risco: comemorar lucro que ainda pode encolher. Fonte: `06` reconhece reembolso; o descasamento é GAP-008.

### INC-8 — Inadimplência de parcelado e chargeback não modelados **(média)**
Venda parcelada tem **não-pagamento de parcelas** (inadimplência) e **chargeback**; nenhum entra na cascata. Para infoproduto de ticket alto parcelado, isto não é residual. Fonte: GAP-008 (só menciona). Decisão: definir tratamento ou declarar explicitamente "fora de escopo da v1".

### INC-9 — Falta a regra que separa "calculável" de "confiável" **(alta, metodológica)**
O blueprint diz "faixas em vez de ponto quando a base é fraca", mas **não define o gatilho**. Não existe: (a) um **nível de confiabilidade** do veredito em função de quantos drivers são `[A]` vs `[D]`; (b) uma regra de **"não decidível"** quando a sensibilidade cruza o zero (go vira no-go dentro da faixa de incerteza). Sem isso, o sistema entrega um número exato que **parece** confiável e não é. Provado nos **Cenários 3 e 5**. → regra operacional a definir.

### INC-10 — Fronteira "IA não toca no número" está declarada, não especificada **(alta, de risco)**
"IA só explica, nunca produz número" é o princípio certo, mas o blueprint não diz **onde** fica a fronteira técnica. Riscos concretos: IA preenchendo uma premissa "default" plausível; IA reescrevendo um veredito em linguagem mais forte do que a evidência; IA "arredondando". Precisa de regra dura: **a IA nunca escreve num campo de premissa nem no resultado do cálculo; só lê e comenta.** → regra operacional a definir.

---

## 2. Fórmulas e regras que PODEM ser aprovadas

Aprováveis como estão (com as ressalvas indicadas):

| Regra | Classificação | Observação |
|---|---|---|
| KPIs com fórmula: CPL, conversão, ROAS, CAC, ticket, presença, abertura/clique, reembolso, abandono (`06`) | `[A-fórmula]` | Matematicamente válidas sempre. **Aprovadas.** |
| **Princípio** da cascata bruto → receita após cancelamentos → lucro → distribuição | `[B]` (direção) | Aprovado **como princípio**; a *implementação* depende de resolver INC-1 a INC-5. |
| Toda premissa é registro tipado (fórmula/exemplo/benchmark/alegação) + confiança + autor | regra operacional | **Aprovada** — é o que torna reproduzível. |
| IA não produz número; cálculo determinístico | regra operacional | **Aprovada em princípio**; falta a fronteira dura (INC-10). |
| 5 tipos-núcleo como enum + tags; dependência externo/perpétuo só após interno validado | `[B]` | **Aprovadas.** |
| "O tipo não define teto de faturamento" | `[A-raiz]`/`[C]` | Aprovada como princípio de recomendação (não cálculo). |
| Dimensionamento bottom-up com **faixa**, não ponto | `[C]` sobre método | Aprovada **após** corrigir INC-6 (dois passos de conversão). |
| Portões diferenciados (bloqueio/alerta/recomendação/discricionário) | regra operacional | **Aprovada** — bom antídoto ao portão rígido decorativo. |
| Go/no-go sobre cenário **conservador** | regra operacional | Aprovada **após** definir o que é "conservador" (haircut explícito — hoje indefinido). |

---

## 3. Regras ambíguas que EXIGEM decisão humana

Nenhuma destas sai do corpus; todas precisam de você (e algumas de contador/jurídico). São o que trava E5:

1. **Base do split:** receita ou lucro? (INC-1) — e as % de cada parte.
2. **Recuperação de investimento inicial:** por cima, antes do split, ou não? E quem banca o adiantado? (INC-2)
3. **Base da comissão de afiliado:** bruto ou líquido de reembolso? (INC-3)
4. **Regime e base tributária:** sobre faturamento ou lucro, e qual alíquota real? (INC-4 — **contador**)
5. **Política de reembolso:** provisão no fechamento? resultado marcado como pré-garantia? (INC-7)
6. **Inadimplência/chargeback:** modelar ou declarar fora de escopo? (INC-8)
7. **Definição de "cenário conservador":** qual o haircut (ex.: −X% na conversão) que define o conservador?
8. **Limiares de confiabilidade:** quantos drivers `[D]` e qual sensibilidade disparam "não decidível"? (INC-9)

---

## 4. Lacunas de dados e evidências

| Lacuna | Efeito no decisor | Fecha com |
|---|---|---|
| GAP-002 — sem benchmark interno (conversão, CAC, reembolso reais) | Toda conversão/CAC é premissa `[D]` → veredito é estrutura, não número confiável | Dados internos Nelogica |
| GAP-004 — economia do revenue share | INC-1/INC-2 não têm como ser resolvidas sem regra de negócio real | Contrato + decisão humana |
| INC-4 base tributária | Cascata não fecha sem regime real | Contador |
| GAP-008 — caixa × faturamento, chargeback, inadimplência | INC-7/INC-8 abertas | Dados de plataforma + financeiro |
| GAP-003 — compliance renda variável | Bloqueio condicional (flag por oportunidade, DEC-010) | Jurídico/CVM |
| GAP-006 — copy | Não afeta E5; bloqueia módulo de copy | Fontes de copy |
| GAP-007 — crítica de agência (v4) | Empobrece contraponto; não bloqueia E5 | Liberar domínio ou colar texto |
| **Sem caso piloto comprometido** | Dá para construir, **não dá para validar** | Decisão humana (o item nº 1 agora) |

**Auditoria de independência das evidências** (brief §3): a cascata "faturamento ≠ lucro" tem convergência `[B]` **real** (systeme.io, Hotmart, Neil Patel tratam o tema de ângulos distintos). Mas **as regras de cálculo detalhadas (bases de incidência, split, recuperação) NÃO vêm de fonte alguma** — são regra operacional a propor + decisão humana. E o grosso do método ainda é **eco de Walker/Érico** (`[A-raiz]`, não `[B]`): repetição não é confirmação independente (DEC-006).

---

## 5. Resultados dos cinco testes

**Modelo de cálculo usado (proposto, para poder testar) — ordem explícita:**
```
1. Bruto            = vendas × ticket
2. (−) Reembolso    = % reembolso × bruto           [reduz receita e estorna taxa — ver nota]
   Receita após cancelamentos = Bruto − Reembolso
3. (−) Comissão afiliado   [BASE A DEFINIR: bruto ou líquido — INC-3]
4. (−) Taxa plataforma     = % × receita após cancelamentos
5. (−) Tráfego (fixo)
6. (−) Produção/entrega (fixo)
7. (−) Ferramentas (fixo)
8. (−) Impostos            [BASE A DEFINIR — INC-4]
   = Lucro operacional
9. (−/÷) Recuperação de investimento + Split  [BASE E ORDEM A DEFINIR — INC-1/2]
   = Resultado por parte
```
Todos os inputs abaixo são **premissas `[D]` fictícias**, nunca benchmarks.

---

### TESTE 1 — Oportunidade economicamente viável
**Entradas `[D]`:** ticket R$2.000; verba tráfego R$20.000; CPL R$8; conversão da lista 2%; reembolso 8%; taxa plataforma 10%; produção R$5.000; ferramentas R$1.000; imposto hipotético 10% sobre receita após cancelamentos; sem afiliado; **N=1 parte**.
**Cálculo:**
- Leads = 20.000 ÷ 8 = **2.500** · Vendas = 2.500 × 2% = **50** · Bruto = 50 × 2.000 = **R$100.000**
- Reembolso 8% → −8.000 → Receita após cancelamentos = **92.000**
- Taxa plataforma 10% × 92.000 = −9.200 · Tráfego −20.000 · Produção −5.000 · Ferramentas −1.000
- Subtotal pré-imposto = 92.000 − 9.200 − 20.000 − 5.000 − 1.000 = **56.800**
- Imposto 10% × 92.000 = −9.200 → **Lucro = 47.600** · ROAS = 100.000/20.000 = **5,0** · Margem/bruto = **47,6%**
**Decisão recomendada:** **viável — mas condicional.** O número é calculável e saudável *se* a conversão de 2% se confirmar; 2% é premissa `[D]`, não dado. → **Avançar para teste de premissa** (verba reduzida/semente) antes de comprometer os R$20.000. Não é um "go" cego.

### TESTE 2 — Fatura muito, lucra pouco (ou nada)
**Entradas `[D]`:** 400 vendas; ticket R$1.500; reembolso 12%; **comissão afiliado 60%**; taxa plataforma 10%; tráfego R$60.000; produção R$30.000; imposto hipotético 6% sobre o bruto.
**Cálculo (comissão sobre o BRUTO):**
- Bruto = 400 × 1.500 = **600.000** · Reembolso 12% → −72.000 → Receita após cancel = **528.000**
- Comissão 60% × 600.000 = −360.000 · Plataforma 10% × 528.000 = −52.800 · Tráfego −60.000 · Produção −30.000 · Imposto 6% × 600.000 = −36.000
- **Resultado = 528.000 − 360.000 − 52.800 − 60.000 − 30.000 − 36.000 = −R$10.800 (PREJUÍZO)**
**O mesmo caso, comissão sobre a RECEITA LÍQUIDA (60% × 528.000 = 316.800):**
- Resultado = 528.000 − 316.800 − 52.800 − 60.000 − 30.000 − 36.000 = **+R$32.400 (LUCRO)**
**Decisão recomendada:** **no-go / renegociar comissão** no caso base. **Achado da auditoria:** R$600 mil de faturamento viram **prejuízo ou lucro conforme uma regra não especificada** (INC-3). Enquanto a base da comissão não for fixada, este cenário **não é decidível de forma inequívoca** — registro a lacuna em vez de inventar a regra.

### TESTE 3 — Dados insuficientes
**Entradas `[D]`:** influenciador com 123.000 seguidores, **sem histórico de vendas, sem lista própria, sem oferta definida, sem verba definida**. Conversão: desconhecida. Ticket: indefinido.
**Cálculo:** impossível produzir faixa útil — **todos os drivers são `[D]`** e a faixa plausível de lucro vai de forte prejuízo a lucro alto (cruza o zero com folga). Tamanho de audiência não prevê venda (SRC-017, `[A]`).
**Decisão recomendada:** **NÃO DECIDÍVEL → coletar dado primário.** O caminho correto é um **lançamento semente / teste pago pequeno** para gerar a primeira conversão real, não um go/no-go. **Achado:** o blueprint hoje mandaria "rodar com premissas `[D]` e mostrar faixa" — mas aqui a faixa é tão larga que a saída honesta é *"não dá para decidir, colete X"*. Falta essa regra (INC-9).

### TESTE 4 — Split / recuperação muda a atratividade
**Base:** o lucro operacional do Teste 1 = **R$47.600**; Nelogica bancou os R$20.000 de tráfego; 3 partes (expert, lançador, Nelogica).
**(a) Split sobre a RECEITA (ex.: expert 30%, lançador 20%):**
- Expert = 30% × 92.000 = **27.600** · Lançador = 20% × 92.000 = **18.400** (juntos 46.000)
- Nelogica (residual, arca com todos os custos de 44.400) = 92.000 − 46.000 − 44.400 = **+1.600**
- → expert+lançador levam 46.000; **a Nelogica, que financiou tudo, fica com 1.600.** Com % um pouco maiores, fica **negativa**.
**(b) Split sobre o LUCRO, igualitário, sem recuperação:** 47.600 ÷ 3 = **15.867 cada**.
**(c) Split sobre o LUCRO, com recuperação primeiro:** Nelogica recupera 20.000 → resta 27.600 ÷ 3 = 9.200 → Nelogica **29.200**, expert **9.200**, lançador **9.200**.
**Decisão recomendada:** **renegociar / definir as regras de split ANTES de qualquer projeção.** **Achado:** a parte do expert vai de **27.600 → 15.867 → 9.200** (≈3×) para o **mesmo lançamento**, só mudando base e ordem (INC-1/INC-2). Sem essas regras, a projeção de um negócio em revenue share **não tem significado**.

### TESTE 5 — Conclusão muda ao alterar uma premissa (sensibilidade)
**Base:** Teste 1, variando só a conversão da lista.
- Contribuição por conversão: receita após cancel = 0,92 × (2.500c × 2.000); deduções proporcionais (plataforma 10% + imposto 10%) = 20% → contribuição = 0,8 × 4.600.000c = **3.680.000c**. Custos fixos = 26.000.
- **Lucro = 3.680.000 × c − 26.000.**
- c = 2,0% → **47.600** (go) · c = 1,0% → **10.800** (fraco) · c = **0,71% → ≈ 0 (break-even)** · c < 0,71% → **prejuízo**.
**Decisão recomendada:** **testar a premissa antes de comprometer verba.** **Achado (o mais importante):** o veredito **inverte de go para no-go** com uma variação de ~1,3 ponto percentual numa premissa que é puro `[D]` (não há benchmark de conversão de infoproduto — GAP-002). Isto é a prova de que **"matematicamente calculável ≠ comercialmente confiável"**: a conta é exata, a entrada é um palpite que atravessa a fronteira do zero. O sistema **precisa** exibir o break-even e a faixa, e rebaixar o veredito a "testar" (INC-9).

---

## 6. Critérios mínimos para considerar o decisor confiável

O decisor só é confiável quando **todos** estes forem verdadeiros:
1. **Cascata totalmente especificada:** ordem fixa + **base de incidência de cada linha** (reembolso, comissão, taxa, imposto) documentada e versionada. (resolve INC-3/4/5)
2. **Motor de split especificado:** base (receita vs lucro) explícita por negócio, ordem dos repasses, tratamento da recuperação de investimento, e um **guard-rail** que alerta quando os repasses baseados em receita excedem o lucro disponível. (resolve INC-1/2)
3. **Política de reembolso/chargeback/inadimplência** definida (provisão + marcação de resultado pré-garantia) ou explicitamente fora de escopo. (resolve INC-7/8)
4. **Reprodutibilidade comprovada:** duas pessoas, com as mesmas premissas, chegam ao mesmo número (o cálculo é determinístico, sem IA no meio). (resolve INC-10)
5. **Regra de confiabilidade:** todo veredito carrega um nível (ex.: quantos drivers `[A]` vs `[D]`) e **vira "não decidível / testar"** quando a sensibilidade cruza o zero dentro da faixa de incerteza. Break-even sempre exibido. (resolve INC-9)
6. **Fronteira da IA dura:** a IA nunca escreve em campo de premissa nem no resultado; só lê, explica e aponta contradição. (resolve INC-10)
7. **Caso piloto real comprometido** para validar — sem ele, nada acima é verificável na prática.

---

## 7. Alterações propostas ao blueprint (propostas — NÃO incorporadas)

Apresento como proposta, para sua aprovação antes de tocar no `LAUNCHOS_PRODUCT_BLUEPRINT.md`:

- **P1 — Especificar o "Motor Financeiro" (§4/E5):** incluir a cascata ordenada com base de incidência por linha (o bloco da §5 deste relatório, depois de você decidir as bases).
- **P2 — Especificar o motor de split:** base por negócio (receita|lucro), ordem dos repasses, recuperação de investimento, e o guard-rail "repasse > lucro disponível → alerta". Substitui o atual "split configurável 1..N" por algo calculável.
- **P3 — Corrigir o dimensionamento (§4/E2):** dois passos de conversão (audiência→lead, lead→venda), encerrando a mistura audiência/lista (INC-6).
- **P4 — Adicionar reembolso como provisão** e marcar todo resultado de fechamento como **pré-garantia** (INC-7); decidir inadimplência/chargeback (INC-8).
- **P5 — Adicionar a camada de confiabilidade (§5):** níveis de confiança do veredito + estado "não decidível" + break-even obrigatório na tela (INC-9).
- **P6 — Fronteira dura da IA (§6):** escrever a regra de que a IA não preenche premissa nem resultado (INC-10).
- **P7 — Definir "cenário conservador"** com um haircut explícito e editável.

Nenhuma destas pode ser *fechada* por mim: P1/P2/P4/P7 dependem de decisões suas (§3) e, em P1/P2, de contador. Posso **redigir** as regras assim que você decidir as bases.

---

## 8. Resposta objetiva à pergunta final

> **O núcleo decisório está suficientemente especificado para começar a implementação, ou ainda existem lacunas que podem comprometer os resultados?**

**Ainda NÃO está — e as lacunas comprometem o resultado em dinheiro, não só o acabamento.**

- A **lógica conceitual e o fluxo** (oportunidade → oferta → modelo → projeção → decisão) estão corretos e defensáveis na *direção*. A casca (E0, E1, E4, biblioteca, marcação de confiança) **pode ser implementada com segurança**.
- O **motor financeiro (E5) — o coração do produto — não pode**, porque **5 regras que mudam o sinal do resultado ainda não existem** (base do split, recuperação de investimento, base de comissão, base de imposto, política de reembolso), e **falta a regra que separa "calculável" de "confiável"**. Implementar E5 agora seria **codificar escolhas arbitrárias dentro da conta** — exatamente o risco que você quis evitar.

**Caminho recomendado:** (1) você decide os 8 pontos da §3 (com contador onde indicado); (2) eu redijo P1–P7 como regras e trago para sua aprovação; (3) confirmamos um **caso piloto real**; (4) só então implementamos E5. A casca (E0/E1/E4 + biblioteca) pode começar em paralelo, se você quiser ganhar tempo — ela não depende dessas decisões.

---

*Auditoria encerrada. Nenhum arquivo original foi alterado. Todos os números dos testes são fictícios e marcados `[D]`; nenhuma alíquota ou conversão foi tratada como benchmark real.*
