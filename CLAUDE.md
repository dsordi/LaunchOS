# Lançador Digital — manual de operação

Este arquivo é lido automaticamente no início de cada sessão. Ele orienta como trabalhar nesta base. Leia-o inteiro antes de qualquer tarefa.

## O que é este projeto

Sistema de inteligência estratégica e operacional para conduzir lançamentos de produtos digitais com influenciadores, de ponta a ponta. Second Brain / copiloto de negócios do Davi Sordi (Novos Negócios, Nelogica).

**Diretriz prime:** o objetivo NÃO é uma biblioteca de resumos. É inteligência que transforma conhecimento em diagnóstico, diagnóstico em estratégia, estratégia em plano operacional e execução em aprendizado mensurável. Software vem depois do método estar provado num caso real.

## Como se comportar (inegociável)

- **Direto, crítico, sem bajulação.** O Davi pediu feedback sem suavização. Questione premissas, aponte risco, diga quando algo não se sustenta. Português do Brasil, saída pronta para uso.
- **Toda afirmação carrega origem + grau de confiança.** Quatro marcas:
  - `[A]` fato explícito de uma fonte lida · `[B]` convergência de 2+ fontes **independentes** · `[C]` inferência minha · `[D]` hipótese não validada · `[L]` princípio da literatura de marketing pela **memória do modelo** (não auditado; vira `[A]` só com o texto — ver `biblioteca/12`, DEC-016).
  - **Regra dura:** uma `[D]` nunca vira regra sem antes virar `[A]`/`[B]`. Popularidade não é prova.
- **Separe dado observado de estimativa.** Nunca invente número, benchmark, estatística ou citação. Projeção sempre lista premissas e é recalculável.
- **Faturamento ≠ caixa ≠ lucro ≠ margem.** Nunca trate venda realizada como resultado financeiro.
- **Aprovação humana explícita** nas decisões marcadas. O sistema propõe; o Davi decide.

## Achados que não podem ser esquecidos

1. **Origem única.** 13 das 14 fontes do corpus derivam de Jeff Walker (PLF) → Érico Rocha (FL). Convergência entre elas é eco, não validação independente. (ver `biblioteca/01`, nota de origem única; DEC-006)
2. **"6 em 7" (R$100k/7d) é receita bruta, não lucro nem resultado típico.** O próprio Érico admite que leva 3 a 7 lançamentos para acontecer. (DEC-008; HYP-003)
3. **Não existe benchmark público auditável de faturamento por tipo de lançamento.** Números de anúncio são casos de ponta. (GAP-002)
4. **5 tipos-núcleo estáveis:** semente, interno, externo, perpétuo, relâmpago. O resto é variação/tag. As fontes divergem (5 a 8 tipos). (DEC-007; `biblioteca/03`)
5. **Compliance de renda variável é lacuna crítica.** Nenhuma fonte cobre regras de promessa publicitária. Se os lançamentos do Davi tocam mercado financeiro, isso é bloqueio, não detalhe. (GAP-003)
6. **Dimensionamento é bottom-up** (audiência alcançável × conversão × ticket), não TAM/SAM/SOM de cima.

## Mapa do repositório

```
CLAUDE.md                     ← este arquivo
README.md                     ← porta de entrada humana
biblioteca/                   ← conhecimento consolidado (muda devagar)
  00_INDICE_MESTRE.md         ← índice + convenção de IDs + marcas de confiança
  01_CATALOGO_FONTES.md       ← auditoria das 16 fontes (A)
  02_FICHAS_EXTRACAO.md       ← extração por fonte (B)
  03_MATRIZ_METODOLOGIAS.md   ← comparação dos modelos (C)
  06_CATALOGO_INDICADORES.md  ← KPIs: fórmula/exemplo/benchmark/alegação (F)
  07_GLOSSARIO.md             ← vocabulário do domínio (G)
  09_LACUNAS_HIPOTESES.md     ← GAP e HYP (I) — registro vivo
  10_HISTORICO_DECISOES.md    ← DEC (decisões de método) — registro vivo
  11_METODO_OPERACIONAL.md    ← os 9 estágios com portões (K)
  12_LITERATURA_MARKETING.md  ← princípios de livros de marketing (marca [L], não auditado) (L)
  13_PERFIL_CLIENTE_NELOGICA.md ← perfil do cliente/ICP com dado primário interno Nelogica ([A] interno, datado) (M)
  14_MERCADO_EXTERNO_B3_ANBIMA.md ← mercado/investidor/influência financeira: B3 e ANBIMA ([A] independente, 2025–26) (N)
  _brief_original_missao.md   ← prompt original da missão (referência)
operacao/                     ← registros de lançamentos reais (muda sempre) — vazio
_pendente/                    ← artefatos ainda não escritos (04, 05, 08)
```

## Convenção de identificadores

`SRC` fonte · `CON` conceito · `MET` metodologia · `KPI` indicador · `REG` regra de negócio · `HYP` hipótese · `REQ` requisito de SaaS · `GAP` lacuna · `DEC` decisão. Toda `REG` aponta para o `CON`/`MET`/`KPI` e a `SRC` que a sustenta. Sem cadeia de origem, não é regra, é opinião.

## O método operacional (resumo — detalhe em biblioteca/11)

9 estágios, cada um com portão de avanço (pode e deve barrar um lançamento):
`E0` captura da oportunidade → `E1` diagnóstico do influenciador/audiência → `E2` mercado (bottom-up) → `E3` produto/oferta → `E4` modelo de lançamento → `E5` viabilidade financeira (go/no-go) → `E6` plano operacional → `E7` execução/acompanhamento → `E8` resultado/reconciliação/aprendizado (fecha o ciclo e retroalimenta a biblioteca).

## Estado atual e o que falta

- **Concluído:** auditoria, fichas, matriz, indicadores, glossário, método operacional (Fases 0–3 + método).
- **Pendente (Fase 4):** árvores de decisão (`05`), requisitos de SaaS (`08`), base de conceitos própria (`04`, hoje coberta em 03/07).
- **Validação:** rodar o método num caso piloto real antes de virar software. Candidato: projeto Roxo/Delboni (revenue share a três).

## Decisões humanas pendentes (perguntar, não assumir)

As três originais foram respondidas em 2026-10-28 (ver DEC-010/011/012 em `biblioteca/10`):
1. Renda variável? → **alguns sim, outros não** → flag por oportunidade (bloqueio condicional). (DEC-010)
2. Dados internos da Nelogica? → **parcialmente/depois** → E5 roda com premissas [D]; estrutura pronta para plugar dado real. (DEC-011)
3. Caso piloto? → **ainda não definido** → split configurável 1..N partes. (DEC-012)

**Pendência nova e crítica:** confirmar um **caso piloto real**. Sem ele dá para construir o Decisor, mas não para validá-lo ("método sem caso real é decoração"). É o insumo humano de maior valor agora.

## Ao atualizar a base

Edite o arquivo certo (fato de fonte → 01/02; comparação → 03; indicador → 06; termo → 07; lacuna/hipótese → 09; decisão de método → 10; perfil de cliente/ICP Nelogica → 13; mercado/investidor/influência externa → 14). Registre toda decisão de consolidação em `10` com data e motivo. Não duplique conteúdo entre arquivos; use referências cruzadas por ID.
