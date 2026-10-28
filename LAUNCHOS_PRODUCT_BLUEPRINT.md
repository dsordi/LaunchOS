# LAUNCHOS — Product Blueprint

> **O que é este documento:** a definição de produto do LaunchOS — qual problema resolve, como o sistema deve pensar, quais capacidades são realmente necessárias e qual é a menor versão que já ajuda a executar um lançamento real. **Não é especificação técnica nem desenho de telas.** Software vem depois.
> **Base de evidência:** os 10 artefatos da biblioteca do projeto (`biblioteca/00`–`11` + `CLAUDE.md`), lidos e verificados. Preservados neste repositório sem alteração.
> **Marcas de confiança (herdadas da base):** `[A]` fato de fonte lida · `[B]` convergência de fontes independentes · `[C]` inferência minha · `[D]` hipótese não validada.
> **Autoria/decisão:** o sistema propõe; o Davi decide. Data: 2026-10-28.

---

## 0. Aviso de método (leia antes)

Três coisas condicionam tudo o que segue e estão ditas de forma crua de propósito:

1. **Esta sessão está sem acesso à internet.** Não reli as 21 URLs ao vivo (DNS não resolve nem para hosts neutros). O blueprint se apoia na base já destilada, que é rastreável. Onde a base registrou "não acessado" (v4company; texto completo da UFRGS), **continua não acessado** — não inventei conteúdo para cobrir o buraco. `[A]`
2. **Origem única do corpus.** 13 das 14 fontes lidas derivam de Walker (PLF) → Érico Rocha (FL). Convergência entre elas é **eco, não validação independente** (DEC-006). Isso rebaixa quase tudo que parece "comprovado" para `[A da fonte-raiz]`, não `[B]`. O LaunchOS precisa carregar esse ceticismo embutido, não apagá-lo. `[A]`
3. **Não existe benchmark público auditável de faturamento por tipo de lançamento** (SRC-001 admite). Logo, o sistema **não pode** ter números de mercado como default. Toda projeção nasce de premissas explícitas e editáveis. `[A]`

Quem ignora esses três pontos constrói uma "biblioteca de resumos bonita que mente com confiança". O LaunchOS existe para fazer o oposto.

---

## 1. Diagnóstico do conhecimento disponível

### 1.1 O que foi efetivamente acessado

| Classe | Fontes | Situação de acesso | Peso de evidência |
|---|---|---|---|
| **Acadêmico** | SRC-017 (UFRJ, Montalvo 2021) | **Integral** | **O mais valioso** — dado primário (9 entrevistados), não-Walker |
| Acadêmico | SRC-016 (UFRGS 2022) | **Só resumo** | Potencialmente independente, mas **texto completo não lido** |
| Comercial de plataforma | SRC-001 HeroSpark, 002 systeme.io, 005/008 Hotmart, 009 InvoiceXpress | Integral | Útil, mas vende ferramenta/método — viés alto |
| SEO/conteúdo | SRC-003, 004, 007, 012 | Integral | Derivativo; baixo valor |
| Perfil/promocional | SRC-014 Marcos Paulo, 015 Brasil Paralelo | Integral | Números autodeclarados — tratar como alegação |
| Escola rival | SRC-013 Alex Vargas (2016) | Integral (transcrição) | Converge na mecânica do funil → eleva **só a espinha** a `[B]`; datado |
| **Não acessado** | SRC-006 v4company; SRC-010 tag | Bloqueado / não-fonte | **Lacuna crítica:** falta a crítica de agência de performance (GAP-007) |

### 1.2 O que tem evidência rastreável vs. o que é eco

- **Convergência real `[B]`** (sobrevive ao teste de origem independente, incluindo escola rival e/ou acadêmico):
  1. A espinha do funil: tráfego → captura → nutrição → oferta com escassez. (SRC-001/013/017/009)
  2. "6 em 7" (R$100k/7d) é **receita bruta, não lucro**. (SRC-002/008/007 explícitos)
  3. O primeiro lançamento raramente bate a meta; leva várias tentativas. (Érico admite 3–7 lançamentos; praticantes relatam tentativa-e-erro)
  4. Escassez só funciona se for verdadeira.
- **Divergência real `[C]`:** taxonomia de tipos (5 a 8, sem consenso); números de origem inflados (R$100k vs R$1mi, 10×); "iniciante deve lançar ou ir ao perpétuo?" (fontes discordam).
- **Tudo o mais** é afirmação de Walker/Érico ecoada — peso `[A da raiz]`, não `[B]`.

### 1.3 O que a base ensina que o sistema precisa saber (síntese funcional, não resumo)

- **5 tipos-núcleo estáveis** (semente, interno, externo, perpétuo, relâmpago) + periferia como tags. O tipo define **esforço/verba/alcance, não teto de faturamento** (HYP-001 parcialmente refutada). `[B]`/`[C]`
- **Dependências entre tipos:** externo e perpétuo só **depois de um interno validado**; relâmpago só com base quente. Isso é regra de sequência, não preferência. `[B]`
- **Estrutura de 4 fases** (pré-pré / pré / carrinho / pós) com 3 CPLs por função psicológica (quebra de crença → prova → ponte). `[A-raiz]`
- **Cascata financeira obrigatória:** bruto − reembolso − taxa plataforma − tráfego − comissão afiliado − produção − ferramentas − impostos − **split de sócios** = lucro. No modelo do Davi (revenue share a 3) o split é **estrutural, entra antes de a conta fazer sentido**. `[B]`/`[A]`
- **9 indicadores com fórmula** (CPL, conversão, ROAS, CAC, ticket, presença, abertura/clique, reembolso, abandono) — sempre válidos. Benchmarks externos (Mailchimp/ON24/Baymard) são **de contexto não-infoproduto** → só ordem de grandeza. `[A-fórmula]`/`[A-bench]`
- **Diagnóstico de influenciador em 3 eixos:** alcance ≠ engajamento ≠ **intenção de compra**. Tamanho de audiência **não previu sucesso** no único dado primário (SRC-017). `[A]`
- **Compliance de renda variável é vazio no corpus** — zero fontes. Se o lançamento toca mercado financeiro, isso é bloqueio, não detalhe. `[A]` (ausência) + GAP-003

---

## 2. A dor principal e os problemas secundários

### 2.1 A dor central (o que o produto existe para resolver)

> **Decidir, com honestidade e de forma defensável, se um lançamento vale a pena — e depois reconciliar o que realmente aconteceu com o que foi projetado, extraindo aprendizado.**

Em uma frase operacional: transformar uma oportunidade confusa em um **veredito de viabilidade reproduzível** (premissas explícitas, recalculável por terceiros), conduzir a execução, e fechar o ciclo comparando previsto × realizado.

Por que essa é a dor certa, e não "organizar lançamentos" `[C]`:
- Onde o dinheiro é perdido não é na falta de organização — é em **premissa errada** (tratar bruto como lucro, usar conversão inventada), em **escolha de modelo por hype** em vez de maturidade, e em **split ignorado** até ser tarde. A base documenta exatamente esses erros.
- Uma planilha já organiza. O que uma planilha **não** faz: carregar as distinções do método (faturamento≠lucro≠caixa), marcar o grau de confiança de cada número, barrar o que deve barrar (compliance), e impedir o autoengano de "meu primeiro lançamento vai fazer 6 em 7".

### 2.2 Problemas secundários (reais, mas subordinados)

| # | Problema | Evidência |
|---|---|---|
| P1 | Escolher o **tipo de lançamento** compatível com o momento, não o "que fatura mais" | 03, HYP-001 |
| P2 | Diagnosticar prontidão do influenciador separando audiência de **intenção de compra** | SRC-017, GAP-005 |
| P3 | Dimensionar mercado **bottom-up**, sem TAM/SAM/SOM de cima | CLAUDE.md, E2 |
| P4 | Não perder a rastreabilidade: saber se um número é fato, exemplo, benchmark ou alegação | 06, DEC-009 |
| P5 | Fechar o ciclo: previsto × realizado vira **aprendizado**, não anedota | E8 |
| P6 | **Compliance** de renda variável (se aplicável) — bloqueio legal | GAP-003 |

### 2.3 O que o produto **não** é (fronteiras, para não virar outra coisa)

- **Não é um CRM.** Não existe para gerir contatos/pipeline de vendas genérico. `[restrição do brief]`
- **Não é uma biblioteca de resumos** nem um chatbot de perguntas. `[CLAUDE.md, diretriz prime]`
- **Não é um gerador de copy** (GAP-006: o corpus não tem profundidade de copy para sustentar isso com qualidade).
- **Não é um painel de métricas** que mostra tudo "porque dá". Indicador só aparece se muda uma decisão.

---

## 3. Princípios operacionais do sistema

Estes são os princípios que o software terá de respeitar, não features. `[A]`/`[B]` da base + `[C]` meus na forma.

1. **Cálculo determinístico; IA só explica.** Todo número vem de fórmula reproduzível, nunca de texto gerado por IA. A IA narra o raciocínio, levanta divergências e redige — mas não produz o resultado numérico. `[brief + C]`
2. **Toda premissa é um registro tipado.** Cada número carrega: valor, natureza (**fórmula / exemplo / benchmark / alegação**), fonte, grau de confiança e quem o definiu. Separar dado observado de estimativa é regra, não enfeite. `[A, 06/DEC-009]`
3. **A cascata nunca para no bruto.** Receita bruta → líquida → lucro → **margem por parte do split**. "Faturamento" sozinho é proibido como resultado. `[B, 06/DEC-008]`
4. **Peso de fonte explícito; eco ≠ prova.** Convergência derivada da mesma raiz (Walker/Érico) não conta como validação. O sistema mostra a origem e não promove `[D]` a regra sem virar `[A]`/`[B]`. `[A, DEC-006]`
5. **Valor antes do formulário.** O usuário recebe um primeiro veredito com o **mínimo de premissas que movem o resultado**. O resto é progressivo e opcional. Nunca dezenas de campos antes de qualquer utilidade. `[brief]`
6. **Portões diferenciados** (ver §5): bloqueio obrigatório ≠ alerta ≠ recomendação ≠ decisão discricionária. Nada de portão rígido sem justificativa. `[brief + C]`
7. **Incerteza à vista, não escondida.** Reduzir trabalho manual sim; esconder que um número é chute, nunca. Faixas em vez de ponto quando a base é fraca. `[brief, E2]`
8. **Aprendizado só vira regra com aprovação humana + rastreabilidade.** O ciclo fecha na biblioteca, mas nenhuma hipótese é promovida silenciosamente. `[A, 11/E8]`

---

## 4. Modelo de funcionamento de ponta a ponta

O método operacional da base (E0–E8) é sólido e eu o adoto como espinha. **Mas a instrução é clara: nem toda etapa é uma tela.** Abaixo cada etapa está descrita como *lógica de negócio* (o que o sistema faz), com os 10 campos pedidos condensados. A tradução em telas é decisão de produto (§8), e a maioria dessas etapas **não** merece tela própria no MVP.

Convenção por etapa: **Problema · Decisão · Insumos · Como obtém · Métodos/regras · Cálculo · Entregável · Revisão · Critério de avanço · O que persiste.**

### E0 — Captura da oportunidade
- **Problema:** vale a pena analisar isto a fundo? · **Decisão:** entra no funil ou arquiva. · **Insumos:** influenciador, nicho, origem da oportunidade, qualquer número solto. · **Como obtém:** o Davi digita (1 frase + identificação). · **Métodos:** checklist de aderência à tese da Nelogica. · **Cálculo:** nenhum. · **Entregável:** Ficha de Oportunidade nível 1. · **Revisão:** o Davi edita livremente. · **Avanço:** aderência mínima + responsável. · **Persiste:** a oportunidade e seu status. 
- *Tela?* Sim — é o ponto de entrada. Leve.

### E1 — Diagnóstico de influenciador e audiência
- **Problema:** ele tem condições reais de lançar? · **Decisão:** pronto / pronto-com-ressalva / não-pronto. · **Insumos:** base por canal, engajamento, histórico de vendas, autoridade. · **Como obtém:** entrada do Davi (dados internos e expertise; a web daria pouco e aqui nem há web). · **Métodos:** decompor em **3 eixos — alcance, engajamento, intenção de compra**; a pergunta-chave é intenção, não tamanho (SRC-017). · **Cálculo:** proporção lista-própria vs. seguidor; sem nota mágica. · **Entregável:** leitura de prontidão qualificada, por eixo, com confiança. · **Revisão:** o Davi confirma/corrige cada eixo. · **Avanço:** prontidão para ao menos um tipo, OU lista clara do que falta. · **Persiste:** fichas de influenciador e audiência.
- *Tela?* No MVP, **um formulário curto embutido na oportunidade**, não um módulo. `[C]`

### E2 — Dimensionamento de mercado (bottom-up)
- **Problema:** há potencial comercial que justifique o esforço? · **Decisão:** faixa de receita plausível vs. esforço. · **Insumos:** audiência alcançável (de E1), ticket de referência, conversão premissada. · **Como obtém:** premissas do Davi; **sem dado interno, conversão é premissa editável, não valor fixo** (GAP-002). · **Métodos:** `audiência alcançável × conversão plausível × ticket`. TAM/SAM/SOM só como contexto. · **Cálculo:** determinístico, com **faixa** e sensibilidade à conversão. · **Entregável:** potencial de receita como faixa + premissas listadas. · **Revisão:** o Davi ajusta premissas e recalcula. · **Avanço:** potencial plausível com premissas explícitas. · **Persiste:** o dimensionamento e suas premissas.
- *Tela?* Funde-se com E5 no MVP (é a mesma calculadora). `[C]`

### E3 — Produto e oferta
- **Problema:** o que se vende, como e por quanto, de forma que a oferta feche? · **Decisão:** oferta definida (produto+preço+garantia+bônus+razão-de-agir). · **Insumos:** dores/desejos (E1/E2), produto existente ou a criar, preço de referência. · **Métodos:** "a oferta é o coração; página bonita não salva oferta fraca" (SRC-001); promessa cabe em uma frase e é sustentável pela entrega; **se toca renda variável → portão de compliance**. · **Cálculo:** margem bruta unitária estimada. · **Entregável:** ficha de oferta + promessa em uma frase + flag de compliance. · **Revisão:** o Davi aprova oferta, preço, promessa. · **Avanço:** oferta definida e promessa sustentável. · **Persiste:** oferta, promessa, flag de compliance.
- *Tela?* Campos dentro da oportunidade. O **flag de compliance** é o que importa aqui (ver §5).

### E4 — Modelo de lançamento e estratégia
- **Problema:** qual tipo cabe no momento da operação? · **Decisão:** escolher 1 dos 5 núcleo (+ justificativa). · **Insumos:** prontidão (E1), produto validado? (E3), verba, prazo, equipe. · **Métodos:** regras de dependência (externo/perpétuo só após interno validado; relâmpago só com base quente); **o tipo não define teto de faturamento**; para expert já com autoridade, ponto de entrada tende a **não** ser semente (HYP-005). · **Cálculo:** nenhum (é seleção guiada por regras). · **Entregável:** modelo escolhido + justificativa rastreável + riscos. · **Revisão:** o Davi aceita o modelo e os riscos. · **Avanço:** modelo com justificativa e riscos explícitos. · **Persiste:** escolha + justificativa + riscos aceitos.
- *Tela?* Um **seletor com recomendações/alertas** (não bloqueio) — ver §5.

### E5 — Projeção financeira e viabilidade (o coração do MVP)
- **Problema:** o lançamento fecha a conta, para **todas as partes**? · **Decisão:** **go / no-go** (formal). · **Insumos:** verba, CPL, conversão premissada, ticket, reembolso, taxas, comissões, custos, **split**. · **Métodos:** cascata do 06 em **3 cenários** (conservador/base/otimista); ponto de equilíbrio; no revenue share, split entra antes (GAP-004). · **Cálculo:** 100% determinístico e recalculável; nenhuma premissa inventada; critério go/no-go = **o cenário conservador é viável para todas as partes?** · **Entregável:** projeção com premissas listadas, 3 cenários, break-even, margem por parte, sensibilidade a conversão e reembolso. · **Revisão:** o Davi valida premissas com dados reais e decide. · **Avanço:** viabilidade no conservador, ou redesenho. · **Persiste:** projeção versionada (premissas editáveis) + decisão go/no-go com fundamento.
- *Tela?* **Sim, a tela-âncora do produto.**

### E6 — Plano operacional
- **Problema:** transformar a estratégia aprovada em execução. · **Decisão:** plano aprovado. · **Insumos:** modelo (E4), cronograma do tipo, equipe, datas. · **Métodos:** quebrar nas 4 fases com dono, prazo, meta por fase e gatilho de alerta. · **Entregável:** plano (tarefas/responsáveis/prazos/metas). · **Avanço:** plano aprovado e medição pronta **antes** de abrir captação. · **Persiste:** o plano.
- *Tela?* **Adiar** no MVP — aqui mora o risco de virar CRM/gerenciador de tarefas genérico. `[C]`

### E7 — Execução e acompanhamento
- **Problema:** rodar acompanhando indicadores e reagindo a desvio. · **Decisão:** ajustes de rota. · **Insumos:** dados reais por fase (CPL real, presença, conversão, ritmo). · **Métodos:** realizado × meta; aquecimento morno prevê carrinho fraco; **escassez honesta** (e, se renda variável, nenhuma promessa nova sem compliance). · **Entregável:** registro ao vivo + log de decisões. · **Persiste:** realizado por fase + decisões.
- *Tela?* **Adiar/mínimo** no MVP (entrada de realizado por fase basta). `[C]`

### E8 — Resultado, reconciliação e aprendizado
- **Problema:** o que realmente sobrou e o que aprendemos? · **Decisão:** quais aprendizados viram regra. · **Insumos:** números finais, reembolsos pós-garantia, repasses. · **Métodos:** reconciliação bruto → caixa → lucro real; análise de desvio; aprendizado candidato → **aprovação humana** → REG. · **Entregável:** registro de resultado + aprendizados + REG propostas. · **Persiste:** resultado real, desvios, regras aprovadas.
- *Tela?* **Mínimo** no MVP (fechar a conta real + anotar aprendizado); automação da promoção a REG, depois. `[C]`

**Leitura do fluxo:** a cadeia de decisão de verdade é **E0 → (E1+E3 leves) → E4 → E5 go/no-go**. É aí que o produto prova valor. E6–E8 são execução e aprendizado — importam, mas não na v1.

---

## 5. Lógica de decisão e tratamento de dados insuficientes

### 5.1 Quatro tipos de "portão" (diferenciados, como o brief exige) `[C sobre base A]`

| Tipo | Significado | Pode barrar avanço? | Exemplos |
|---|---|---|---|
| **Bloqueio obrigatório** | Consequência legal/externa; não é opinião | **Sim** | Renda variável sem parecer jurídico → copy não é liberada (GAP-003) |
| **Alerta** | Risco material que o usuário precisa ver, mas pode assumir | Não (exige ciência) | Projeção que depende de conversão `[D]` sem dado interno; alta sensibilidade |
| **Recomendação** | Caminho de menor risco sugerido pela base | Não | "Externo só após interno validado"; "para iniciante, considerar perpétuo" |
| **Decisão discricionária** | Julgamento do Davi; sistema só registra o fundamento | Não | Escolher otimista como cenário-meta assumindo o risco |

Regra de ouro: **o sistema só cria bloqueio quando há justificativa externa (lei, contrato, caixa negativo no conservador).** Tudo mais é alerta/recomendação. Isso evita o "portão rígido decorativo".

### 5.2 Como lidar com dados faltando (sem travar e sem esconder incerteza)

1. **Toda análise roda com o que houver.** Faltando um número, o sistema usa premissa explícita marcada `[D]` e **mostra a faixa**, não um ponto.
2. **O sistema identifica a lacuna e explica a importância** antes de pedir: "sem a taxa de reembolso real, o lucro pode variar X%; quer informar ou seguir com faixa?".
3. **Só pede o que muda a análise.** Se a sensibilidade a um campo é baixa, ele não interrompe o usuário por aquele campo. (Combate direto ao "dezenas de campos".)
4. **Nunca completa buraco com número de mercado inventado.** Ausência de benchmark é dita, não preenchida. (GAP-002)

### 5.3 Exemplo concreto da lógica (E5, caso revenue share)

Entradas mínimas que movem o resultado: ticket, conversão premissada, audiência alcançável, verba de tráfego, taxa de plataforma, **split (3 partes)**. O motor calcula bruto → líquida → lucro total → **lucro por parte** nos 3 cenários + break-even. Se, no conservador, **qualquer parte** fica negativa → **alerta forte** (não bloqueio automático, porque o Davi pode renegociar o split). Se toca renda variável e não há parecer → **bloqueio** na etapa de copy, registrado desde E3.

---

## 6. Mecanismo de inteligência e rastreabilidade

### 6.1 Como o LaunchOS "pensa" (e por que não é um chatbot) `[C]`

Com **16 fontes**, busca vetorial/RAG sobre texto de blog é força bruta desnecessária e pouco confiável. A inteligência vem de uma **biblioteca curada como pequeno grafo de conhecimento** (que **já existe**: SRC/MET/KPI/CON/REG/GAP/HYP) com **vínculos fixos entre cada etapa de análise e os nós de conhecimento relevantes**:

- Em **E4**, o sistema puxa MET-001 + taxonomia dos 5 tipos + regras de dependência — e mostra a divergência (HYP-004: semente vs. perpétuo para iniciante) em vez de esconder.
- Em **E5**, puxa a cascata do 06 + fórmulas KPI + GAP-002/004 — e marca cada número por natureza.

A IA entra para: **narrar o raciocínio, explicar premissas, apontar contradições e redigir texto** — nunca para produzir número nem para decidir sozinha.

### 6.2 Rastreabilidade (o diferencial defensável)

- **Cada afirmação carrega origem + confiança** `[A]/[B]/[C]/[D]` e, quando número, a **natureza** (fórmula/exemplo/benchmark/alegação).
- **Cálculo reproduzível:** mesma entrada → mesmo resultado, sem IA no meio. Um terceiro chega ao mesmo número com as mesmas premissas (critério de validação do método).
- **Detecção de contradição:** quando uma premissa do usuário se apoia em `[D]`/alegação, o sistema sinaliza (ex.: usar "conversão 42–50% do Alex Vargas" dispara alerta: single-source, 2016, não verificável).
- **Registro de decisão humana:** toda decisão marcada guarda quem, quando e **por quê**.
- **Aprendizado candidato → regra:** resultado real (E8) gera candidato; só vira REG com aprovação explícita e cadeia de origem.

---

## 7. Modelo conceitual dos dados (entidades, não esquema de banco)

Nível conceitual apenas — arquitetura técnica fica para depois.

**Entidades centrais (o fluxo):**
- **Oportunidade** — a espinha; carrega status pelas etapas.
- **Influenciador/Expert** — *uma* entidade com atributos nos **3 eixos** (autoridade, audiência, intenção); expert e influenciador são atributos, não entidades separadas (resolve a ambiguidade do glossário). `[A, 07]`
- **Audiência** — por canal, com alcance/engajamento/intenção.
- **Oferta** — produto + preço + garantia + bônus + razão-de-agir + promessa (1 frase) + **flag de compliance**.
- **ModeloDeLançamento** — **enum fechado dos 5 núcleo** + campo de tags para a periferia (resolve a divergência de taxonomia). `[B, DEC-007]`
- **Projeção** — versionada; contém um conjunto de **Premissas** e os 3 cenários calculados.
- **Premissa** — entidade de primeira classe: valor, **natureza** (fórmula/exemplo/benchmark/alegação), fonte, confiança, autor. (É o que torna tudo reproduzível e honesto.) `[A, 06]`
- **Plano** / **ExecuçãoPorFase** / **Resultado** — operação e reconciliação (pós-MVP).
- **DecisãoHumana** — quem, quando, porquê; ligada à etapa.
- **Aprendizado** — candidato → aprovado (vira REG).

**Biblioteca (conhecimento, muda devagar):**
- **Fonte (SRC)**, **Metodologia (MET)**, **Indicador (KPI)**, **Conceito (CON)**, **Regra (REG)**, **Lacuna (GAP)**, **Hipótese (HYP)** — cada um com confiança e cadeia de origem. Já existe em `.md`; no produto vira dado consultável, **somente-leitura pela interface** (a base muda com cuidado, não por clique).

**Decisões de modelagem herdadas (não reabrir sem motivo):** CPL desambiguado (Conteúdo de Aquecimento × Custo por Lead); tipos = 5 enum + tags; expert/influenciador = atributos. `[A, 07/DEC-007]`

---

## 8. Capacidades essenciais e funcionalidades priorizadas

### 8.A Capacidades essenciais (o que o sistema sabe fazer)
1. Capturar e qualificar uma oportunidade. 
2. Diagnosticar prontidão em 3 eixos. 
3. **Projetar viabilidade financeira reproduzível com split e 3 cenários** (núcleo). 
4. Recomendar modelo de lançamento por regras de dependência. 
5. Marcar confiança e natureza de todo dado; citar origem. 
6. Registrar decisões e fundamentos. 
7. Reconciliar previsto × realizado e capturar aprendizado (com aprovação). 
8. Consultar a biblioteca rastreável no contexto da análise.

### 8.B Priorização (impacto na decisão × frequência × redução de trabalho × confiabilidade × esforço)

| Capacidade | Impacto | Frequência | Confiabilidade | Esforço | Veredito |
|---|---|---|---|---|---|
| Projeção de viabilidade (E5) c/ split | Altíssimo | Toda oportunidade | Alta (determinística) | Médio | **MVP** |
| Captura de oportunidade (E0) | Alto | Toda | Alta | Baixo | **MVP** |
| Diagnóstico 3 eixos (E1, leve) | Alto | Toda | Média | Baixo | **MVP** |
| Seleção de modelo (E4) c/ regras | Alto | Toda | Média | Baixo | **MVP** |
| Flag/portão de compliance (E3) | Alto (se renda variável) | Condicional | Alta | Baixo | **MVP — flag por oportunidade** |
| Biblioteca consultável (leitura) | Médio | Média | Alta | Baixo | **MVP** (confiança) |
| Plano operacional (E6) | Médio | 1×/lançamento | Média | Alto | **Adiar** |
| Execução ao vivo (E7) | Médio | Durante carrinho | Média | Alto | **Adiar** |
| Reconciliação + aprendizado (E8) | Alto (longo prazo) | 1×/lançamento | Média | Médio | **Adiar (v1.1)** |
| Geração de copy | Médio | — | **Baixa (GAP-006)** | Alto | **Bloqueado por lacuna** |
| Pesquisa automática de mercado/concorrente | Médio | — | Baixa (precisa web+dados) | Alto | **Adiar** |

---

## 9. Escopo recomendado para o MVP

**Nome de trabalho:** *Decisor de Viabilidade de Lançamento.*

> **Decisões travadas em 2026-10-28** (respostas do Davi; DEC-010/011/012):
> - Compliance renda variável = **flag por oportunidade** (bloqueio condicional), não global.
> - Projeção E5 = **só premissas `[D]` no MVP**; estrutura pronta para plugar dado interno real depois (não há número da Nelogica agora).
> - Split = **configurável de 1 a N partes**; caso piloto ainda não definido.
> Consequência honesta: o go/no-go da v1 valida **o método** (reprodutibilidade, cascata, confiança), não um número calibrado pela realidade. E sem piloto comprometido, o Decisor não tem como ser validado.

> A menor versão que **já ajuda a executar um lançamento real**: leva uma oportunidade de uma frase até um **go/no-go defensável**, com premissas explícitas e a conta certa (incluindo split), sem exigir dezenas de campos.

**Dentro do MVP:**
1. **Oportunidade** (E0) — identificação + hipótese em 1 frase; status.
2. **Prontidão leve** (E1) — 3 eixos qualitativos, com destaque para intenção de compra.
3. **Oferta básica** (E3) — ticket, produto existe?, **flag renda variável** (liga o bloqueio de compliance, se aplicável).
4. **Modelo** (E4) — seletor dos 5 núcleo com **recomendações/alertas** de dependência (não bloqueio).
5. **Projeção de viabilidade** (E5) — a tela-âncora: premissas editáveis e tipadas, 3 cenários, cascata até lucro, **split configurável de 1 a N partes** (margem por parte), break-even, sensibilidade a conversão e reembolso, veredito go/no-go sobre o conservador.
6. **Biblioteca** — visualização somente-leitura dos `.md`, para consulta rastreável.
7. **Persistência** real + **registro de decisão** (go/no-go com fundamento) + versionamento da projeção.

**Fora do MVP (espera, mesmo parecendo interessante):** plano operacional rico (E6), execução ao vivo (E7), automação do aprendizado→REG (E8 fica manual/mínimo), geração de copy, pesquisa automática de mercado, multiusuário/permissões. Justificativa: ou têm esforço alto, ou dependem de lacuna (copy/GAP-006; mercado/GAP-002), ou arrastam o produto para CRM genérico.

**Princípio de UX inegociável do MVP:** o usuário chega ao primeiro veredito preenchendo **só as premissas que movem o número**. Tudo mais é progressivo.

---

## 10. Critérios de validação com um caso real

Regra da base: **método sem caso real preenchido é decoração.** Candidato: **Roxo/Delboni** (revenue share a 3 — exercita o split, que é o diferencial).

O MVP passa no teste se, rodando o caso real:
1. **Reprodutibilidade:** outra pessoa, com as mesmas premissas, chega ao mesmo número. (Se não, o motor não é determinístico o suficiente.)
2. **Honestidade de confiança:** todo número aparece marcado por natureza/confiança; nada de benchmark inventado.
3. **Go/no-go defensável:** o veredito do cenário conservador se sustenta sob questionamento, e considera **as 3 partes do split**.
4. **Portões certos:** compliance barra o que deve barrar (se renda variável); alertas aparecem sem travar indevidamente.
5. **Valor rápido:** do zero ao primeiro veredito em poucos minutos, sem muro de formulário.
6. **Captura o erro clássico:** o sistema impede tratar bruto como lucro e sinaliza premissa `[D]`.

Depois: rodar um **segundo caso de perfil diferente** para ver se generaliza ou se colou no primeiro. Só então congelar o método e pensar em requisitos de software mais amplos.

---

## 11. Lacunas, riscos e decisões pendentes

**Lacunas que limitam capacidades (da base):**
- **GAP-002** — sem benchmarks internos reais (conversão, CAC, reembolso), E2/E5 rodam como **estrutura com premissas editáveis**, não com número de verdade. Limita confiança, não a mecânica.
- **GAP-003** — compliance de renda variável: **bloqueio**, não ajuste, se aplicável. Precisa de insumo jurídico/CVM.
- **GAP-004** — economia do revenue share depende de contrato e números internos.
- **GAP-006** — copy sem profundidade → não dá para construir geração de copy confiável agora.
- **GAP-007** — falta a crítica da agência de performance (v4company, não acessada) → equilíbrio crítico incompleto.

**Riscos do produto `[C]`:**
- **Virar CRM/gerenciador de tarefas** se E6/E7 entrarem cedo demais. Mitigação: adiá-los.
- **Falsa precisão:** projeção bonita dá sensação de certeza. Mitigação: faixas + marcação de confiança obrigatórias.
- **Ambiente sem rede** nesta sessão: qualquer capacidade que dependa de buscar a web não funciona aqui até liberação.
- **Viés de origem única** contaminar recomendações. Mitigação: peso de fonte explícito embutido.

**Decisões humanas — status em 2026-10-28:** as três que alteravam o desenho foram respondidas (DEC-010/011/012): compliance = flag por oportunidade; projeção = premissas `[D]` com estrutura para dado futuro; split = configurável 1..N. **Resta uma, agora a mais importante: confirmar um caso piloto real** — sem ele o Decisor é construível mas não validável.

---

## 12. Relação entre recomendações e fontes

| Recomendação do blueprint | Deriva de | Confiança |
|---|---|---|
| Dor central = decisão de viabilidade + reconciliação | Inferência sobre 06/11 + erros documentados | `[C]` |
| Cascata obrigatória bruto→lucro→split | SRC-002/008/007; cascata 06; GAP-004 | `[B]`/`[A]` |
| 5 tipos-núcleo como enum + tags | Matriz 03; DEC-007 | `[B]`→modelagem `[C]` |
| Dependência externo/perpétuo após interno | SRC-005/008; HYP-002 | `[B]` |
| Tipo não define teto de faturamento | SRC-001; HYP-001 (parcial. refutada) | `[A-raiz]`/`[C]` |
| Diagnóstico em 3 eixos (intenção ≠ audiência) | SRC-017 (dado primário); GAP-005 | `[A]` |
| Premissa como entidade tipada; cálculo determinístico | 06/DEC-009 + restrição do brief | `[A]`/`[C]` |
| Compliance como bloqueio (se renda variável) | GAP-003 (ausência no corpus) + papel Nelogica | `[A]`(ausência)/`[C]` |
| Eco ≠ validação; peso de fonte explícito | 01 nota de origem única; DEC-006 | `[A]` |
| Expert/influenciador = atributos; CPL desambiguado | Glossário 07 | `[A]` |
| MVP = Decisor de Viabilidade; adiar E6–E8 | Priorização minha sobre o método 11 | `[C]` |
| Para expert com autoridade, entrada ≠ semente | HYP-005 | `[D]` (não validada) |

---

*Fim do blueprint. Materiais originais preservados em `biblioteca/` e `CLAUDE.md`, sem alteração. Nenhum dado de mercado, fonte ou conclusão foi inventado; lacunas estão registradas como tais.*
