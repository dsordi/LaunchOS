# Artefato C — Matriz Comparativa de Metodologias e Modelos de Lançamento

> Compara os modelos pelas **condições de aplicação**, não pela nomenclatura (regra do projeto, seção 5). O achado central desta matriz é a **divergência de taxonomia** entre as fontes — elas usam nomes parecidos para coisas diferentes, e listas de tamanhos diferentes.

---

## 1. Metodologia-raiz (MET-001): a estrutura de 4 fases de Walker/Érico

**Fonte:** Walker (PLF) via SRC-017, SRC-001, SRC-009 e praticamente todas. **Confiança: [A] da fonte-raiz** (não [B] — é a mesma origem ecoada).

| Fase | Nome(s) nas fontes | Objetivo | Entregáveis |
|------|--------------------|----------|-------------|
| 0 | Pré-pré-lançamento / Captação | Construir/aquecer lista; sondar oferta e objeções | Lista de leads, página de captura, isca |
| 1 | Pré-lançamento / Aquecimento | Entregar valor, ativar gatilhos, preparar decisão | Sequência de 3 CPLs (quebra de crença → prova → ponte) |
| 2 | Lançamento / Carrinho aberto | Abrir oferta por tempo limitado | Página de vendas, sequência de e-mails/WhatsApp, oferta |
| 3 | Pós-lançamento | Entregar, fidelizar, recuperar quem não comprou | Onboarding, downsell, transição para perpétuo |

**Pré-requisitos:** audiência (própria ou emprestada); oferta definida; capacidade de entrega.
**Decisões-chave:** oferta (o que/preço/garantia/bônus); tipo de lançamento; duração do carrinho; canais.
**Indicadores por fase:** ver `06_CATALOGO_INDICADORES.md`.
**Riscos:** concentração de receita no pico; meses de "vale" entre lançamentos; dependência de execução impecável no dia D.

---

## 2. A divergência de taxonomia (o ponto crítico)

**Nenhuma regra universal de "quantos tipos existem".** As fontes discordam no número e nas definições. Isto é evidência de que **o mercado não tem um consenso taxonômico** — e de que copiar "os 6 tipos" de qualquer fonte como verdade é erro.

| Tipo | HeroSpark (SRC-001) | systeme.io (SRC-002) | Hotmart tipos (SRC-005) | Hotmart FL (SRC-008) | Neil Patel (SRC-007) |
|------|:---:|:---:|:---:|:---:|:---:|
| Semente | ✅ | ✅ | ✅ | ✅ | ✅ |
| Hiper-semente | — | — | — | ✅ | — |
| Interno | ✅ | ✅ | ✅ | ✅ | ✅ |
| Semi-interno | — | ✅ | — | — | — |
| Externo | ✅ | ✅ | ✅ | ✅ | — |
| Afiliado | (dentro de externo) | — | — | ✅ | ✅ |
| Perpétuo | ✅ | ✅ | ✅ | ✅ | ✅ |
| Relâmpago | ✅ | ✅ | ✅ | ✅ | ✅ |
| Relançamento | — | ✅ | — | — | — |
| Desafio/Challenge | ✅ | — | — | — | — |
| E-commerce | — | — | — | ✅ | — |
| Espartano | — | — | — | — | ✅ |
| **Total de tipos** | **6** | **7** | **5** | **8** | **6** |

**Leitura crítica:**
- [B] **Núcleo estável (5 tipos aparecem em quase todas):** semente, interno, externo, perpétuo, relâmpago. Esses têm convergência real suficiente para serem tratados como categorias de referência.
- [C] **Periferia instável:** semi-interno, relançamento, desafio, afiliado, espartano, e-commerce, hiper-semente aparecem em uma ou duas fontes. Alguns são **subtipos** (afiliado é uma forma de externo; relançamento é um interno repetido), outros são **batismos de marketing** de um autor. Não tratar como categorias independentes sem validação.
- **Regra para o SaaS:** o modelo de dados deve ter os **5 tipos-núcleo como enum estável** e tratar os demais como **variações/tags**, não como entidades de primeira classe. (Ver REQ no 08, a produzir.)

---

## 3. Matriz de condições de aplicação dos 5 tipos-núcleo

Confiança da matriz: **[B/C]** — a descrição de cada tipo converge entre fontes ([B] para o núcleo), mas a atribuição de "quando usar" mistura consenso das fontes [B] com inferência minha [C]. Faturamento relativo é **[C/D]** porque **não há benchmark auditável** (SRC-001 admite).

| Critério | Semente | Interno | Externo | Perpétuo | Relâmpago |
|----------|---------|---------|---------|----------|-----------|
| **Problema que resolve** | Validar ideia sem produto pronto | Faturar na própria base | Escalar alcance além da base | Previsibilidade/fluxo diário | Caixa rápido na base quente |
| **Produto precisa estar pronto?** | Não (vende a 1ª turma) | Sim, validado | Sim, comprovadamente convertendo | Sim, validado | Sim |
| **Audiência exigida** | Pequena (centenas) | Própria + captada | De terceiros (afiliados) | Fluxo de tráfego constante | Base engajada existente |
| **Verba de tráfego** | Baixa/zero | Média a alta | Variável (afiliado traz) | Constante | Baixa |
| **Maturidade da operação** | Iniciante | Intermediária | Avançada | Avançada (pós-interno) | Qualquer, com base pronta |
| **Duração típica** | Variável (ao vivo) | ~30 dias total, carrinho 3–7d | ~30 dias + recrutar parceiros | Contínuo | 24–72h (Hotmart: 2–10d) |
| **Pré-requisito de sequência** | Nenhum (porta de entrada) | — | **Só depois de interno validado** | **Só depois de interno de sucesso** | Base já relacionada |
| **Risco principal** | Tratar como definitivo | Captar lead frio demais | Promover produto não-validado (queima afiliado) | Urgência falsa; estagnação | Uso frequente → base aprende a esperar |
| **Faturamento relativo** | Baixo (1ª turma) | Médio-alto | Alto (maior teto) | Médio recorrente | Baixo-médio, rápido |

**Nota sobre "faturamento relativo":** [D] — é a ordenação qualitativa que as fontes sugerem, **sem nenhum número auditável por trás**. Não usar para projeção. O próprio SRC-001 diz que o que define faturamento é oferta + aquecimento + qualidade da audiência, **não o rótulo do tipo**.

---

## 4. Convergências, divergências e lacunas entre fontes

**Convergências reais [B] (aparecem em fontes de origem distinta, incluindo Alex Vargas e/ou acadêmico):**
1. A espinha do funil: tráfego → captura de e-mail → nutrição → oferta com escassez. (SRC-001, 013, 017, 009 — inclui escola rival e acadêmico.)
2. "6 em 7" (R$100k/7d) é **receita bruta, não lucro**. (SRC-002, 008, 007 convergem explicitamente.)
3. O primeiro lançamento raramente atinge a meta; leva várias tentativas. (SRC-008 cita o próprio Érico; SRC-017 praticantes relatam tentativa-e-erro; SRC-002 "não recuperaram o investimento".)
4. Escassez só funciona se for verdadeira. (SRC-001 enfático; implícito nos demais.)

> **Adendo 2026-10-28 (SRC-018, origem independente B2B):** a espinha genérica do funil (atrair → educar → intenção → converter → reter) reaparece numa escola de GTM B2B totalmente distinta, reforçando-a como estrutura `[B]` — **mas só a estrutura genérica**, não a mecânica de lançamento B2C. SRC-018 acrescenta duas camadas que o corpus não tinha: **fidelização/indicação** (GAP-009) e **ser citável por IA / AEO** (HYP-006). Divergência: SRC-018 é B2B (ciclo longo, SDR, sinais tipo funding), não infoproduto B2C → ver GAP-010.

**Divergências [C]:**
1. **Taxonomia dos tipos** (seção 2 acima) — a maior divergência.
2. **Números de origem** — primeiro lançamento de Érico: R$100k (SRC-007) vs R$1 mi (SRC-015). Inflação promocional.
3. **Iniciante deve lançar ou ir ao perpétuo?** SRC-001 e maioria: comece com semente (lançamento). SRC-008 (debate Hotmart): para iniciante, **perpétuo** tende a ser mais seguro. Divergência real de recomendação → a resposta depende do perfil (ver árvore de decisão, 05, a produzir).

**Lacunas temáticas da coleção (o que quase ninguém cobre bem):**
- Economia unitária real, margem, reembolso, LTV/CAC com números → GAP-002.
- Copywriting com profundidade (fórmulas, estrutura de VSL/carta) → SRC-012 é raso; só Alex Vargas dá uma estrutura de oferta.
- Compliance/publicidade — **zero fontes**. Nenhuma trata de regras de promessa, essencial para renda variável → GAP-003.
- Perspectiva crítica de agência de performance → perdida com o bloqueio da V4 (SRC-006).

---

## 5. Síntese para decisão (ponte para o Artefato E)

A sequência de maturidade que as fontes **mais** sustentam (não é lei, é o caminho de menor risco que converge entre elas):

```
Sem produto / sem validação  → SEMENTE (valida e financia a 1ª turma)
         ↓ (validou demanda e oferta)
Base própria + verba          → INTERNO (cavalo de batalha, previsibilidade)
         ↓ (interno converteu bem)
         ├── Escalar alcance   → EXTERNO (afiliados) 
         └── Previsibilidade   → PERPÉTUO (automatiza o que funcionou)
         ↓ (a qualquer momento, com base quente)
Precisa de caixa rápido       → RELÂMPAGO (sem abusar da frequência)
```

**Ressalva [C]:** esta árvore assume o perfil "expert construindo do zero". Para o contexto do Davi (expert com **autoridade e audiência já estabelecidas** no mercado financeiro, operando via lançador em revenue share), o ponto de entrada provavelmente **não é o semente** — pula direto para interno/externo, porque produto e autoridade já existem. Isso precisa ser confirmado caso a caso e é exatamente o tipo de diagnóstico que o SaaS deveria automatizar.
