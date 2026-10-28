# Índice Mestre — Base de Conhecimento: Lançamentos Digitais

> **Projeto:** Launch Intelligence (Lançador Digital)
> **Objetivo:** base rastreável para decisão em lançamentos digitais e, depois, para requisitos de um SaaS.
> **Estado:** Fases 0, 1 e 2 concluídas + consolidação parcial (Fase 3). Faltam árvores de decisão (E) e requisitos de SaaS (H).
> **Última atualização:** 2026-10-28

---

## Como esta base funciona

Nada entra sem **origem** e **nível de confiança**. Toda afirmação carrega uma de quatro marcas:

| Marca | Significado | Peso na decisão |
|-------|-------------|-----------------|
| **[A] Fato da fonte** | Dito explicitamente por uma fonte acessada e lida | Alto, mas vale o quanto a fonte vale |
| **[B] Síntese convergente** | Afirmado por 2+ fontes **independentes** (não derivadas da mesma origem) | Alto |
| **[C] Inferência** | Raciocínio estratégico meu a partir do material | Médio — é interpretação, não prova |
| **[D] Hipótese** | Ainda não validado; precisa de evidência | Baixo — não vira regra automática |

Regra dura: **uma [D] nunca é promovida a regra sem virar [A] ou [B] antes.** Popularidade de um método não é evidência de eficácia.

## Convenção de identificadores

| Prefixo | Tipo | Arquivo onde vive |
|---------|------|-------------------|
| `SRC-###` | Fonte | 01_CATALOGO_FONTES.md |
| `CON-###` | Conceito | (Fase 3) 04_BASE_CONCEITOS.md |
| `MET-###` | Metodologia / framework | (Fase 3) 03_MATRIZ_METODOLOGIAS.md |
| `KPI-###` | Indicador / fórmula | (Fase 3) 06_CATALOGO_INDICADORES.md |
| `REG-###` | Regra de negócio | (Fase 4) 05_ARVORES_DECISAO.md |
| `HYP-###` | Hipótese pendente | 09_LACUNAS_HIPOTESES.md |
| `REQ-###` | Requisito potencial do SaaS | (Fase 4) 08_OPORTUNIDADES_SAAS.md |
| `GAP-###` | Lacuna de conhecimento | 09_LACUNAS_HIPOTESES.md |
| `DEC-###` | Decisão de consolidação | 10_HISTORICO_DECISOES.md |

Toda `REG-###` aponta para o `CON`/`MET`/`KPI` que a sustenta e para a `SRC` de origem. Sem cadeia de origem, não é regra — é opinião.

## Mapa dos artefatos (A–J)

| Artefato | Arquivo | Fase | Estado |
|----------|---------|------|--------|
| A — Auditoria de fontes | 01_CATALOGO_FONTES.md | 1 | **concluído** (16 fontes, 14 lidas) |
| B — Fichas de extração | 02_FICHAS_EXTRACAO.md | 2 | **concluído** (14 fichas) |
| C — Matriz de metodologias | 03_MATRIZ_METODOLOGIAS.md | 3 | **concluído** |
| D — Base de conceitos | 04_BASE_CONCEITOS.md | 3 | coberto dentro de 03 e 07; arquivo próprio pendente se necessário |
| E — Árvores de decisão | 05_ARVORES_DECISAO.md | 4 | **pendente** — próximo passo |
| F — Catálogo de indicadores | 06_CATALOGO_INDICADORES.md | 3 | **concluído** |
| G — Glossário do domínio | 07_GLOSSARIO.md | 3 | **concluído** |
| H — Oportunidades de SaaS | 08_OPORTUNIDADES_SAAS.md | 4 | **pendente** |
| I — Lacunas e hipóteses | 09_LACUNAS_HIPOTESES.md | contínuo | atualizado (9 GAP, 5 HYP) |
| J — Este índice mestre | 00_INDICE_MESTRE.md | contínuo | ativo |
| — Histórico de decisões | 10_HISTORICO_DECISOES.md | contínuo | atualizado (9 decisões) |

## Sequência de trabalho acordada

0. **Esqueleto** (feito) — estrutura e convenções, sem fonte.
1. **Auditoria** — inventário real do que foi recebido e do que abriu.
2. **Extração individual** — uma ficha por fonte, antes de qualquer síntese.
3. **Consolidação** — matriz, conceitos, indicadores, glossário.
4. **Decisão e SaaS** — árvores de decisão e requisitos funcionais.

O que trava o avanço é sempre a fase anterior. Fases 2–4 sem fonte seriam invenção, e não serão feitas assim.
