# Artefato M — Perfil do Cliente e Público-Alvo da Nelogica (dado primário interno)

> **Natureza:** primeira camada do corpus com **dado primário da própria Nelogica**, não derivado de Walker/Érico. Marca dominante: **`[A] interno`** — fato lido de primeira mão em documento da empresa.
> **Ressalva prime (ler antes de usar qualquer número):** os dados são **datados** e vêm de **dois estudos distintos, com amostras e recortes diferentes que não se cruzam diretamente**. Ver "Avisos críticos". Nenhum número aqui é "estado atual garantido" — é a melhor evidência interna disponível, com data.

Fontes: **SRC-035** (Projeto Persona) e **SRC-036** (Segmentação de Clientes, nov/2023). Fichas em `02`. Decisão de absorção: **DEC-024** em `10`.

---

## Avisos críticos (o que impede o uso ingênuo destes números)

1. **Data.** `Segmentação de Clientes` = **novembro/2023**. `Projeto Persona` não traz data na capa, é **anterior** (provável 2022). Entre a coleta e hoje (out/2026) há 2–3 anos: base de clientes, ticket, mix de produto e canais podem ter mudado. Toda regra derivada daqui carrega "válido na data da coleta, revalidar".
2. **Dois estudos, duas réguas de segmentação que não se cruzam.**
   - `Projeto Persona` segmenta por **estilo operacional**: Análise Gráfica 56% · Análise Mista 16% · Leitores de Fluxo 12% · Traders de Ação 16%.
   - `Segmentação` segmenta por **produto/ativo e atividade**: BM&F 52% · Inativos 31% · Bovespa 16% (dos **ativos**: BM&F 52% / Bovespa 16%; mais Inativos 31%).
   - **Não há tabela de passagem entre as duas.** Um "Análise Gráfica" pode ser BM&F ou Bovespa. Cruzar as duas taxonomias é inferência `[C]`, nunca `[A]`.
3. **Tempo de vida do cliente diverge entre os estudos.** Persona: **3,62 a 5 meses** (rotulado "meses" ao lado do LTV). Segmentação: **"CLT mediano" 11 a 20 meses**. Provável diferença de definição (meses *pagando/ativo* vs. tempo *total de conta*) ou mudança temporal. **Até reconciliar a definição, o tempo de vida é faixa ampla [A-ambíguo], não um número.**
4. **"Ticket médio" e "LTV" sem definição formal no documento.** Interpretação mais coerente (inferência `[C]`): ticket médio ≈ **mensalidade média em R$/mês**; LTV ≈ **receita total por cliente**. Ex.: Análise Gráfica LTV R$400,51 ÷ 3,62 meses ≈ R$110/mês, próximo do ticket R$148 da Segmentação — os números são **compatíveis em ordem de grandeza**, o que dá alguma confiança à leitura. Mas é leitura, não definição do documento.
5. **Viés de autosseleção.** Taxa de resposta baixa (Segmentação: **8% a 19%** por segmento). Quem responde pesquisa tende a ser o mais engajado → NPS e satisfação provavelmente **superestimados** para a base total.
6. **Pesquisa de Marketing (340 resp.) sem diferença significativa entre grupos** → o próprio documento trata como **fonte única para todos os grupos**. Logo, demografia/mídia/hobbies/influencers valem para o agregado, **não** para distinguir segmentos.

---

## 1. Tamanho relativo dos segmentos (Segmentação, nov/2023) `[A] interno`

| Segmento | % da base | NPS declarado | Taxa de resposta |
|---|---|---|---|
| **BM&F** (day trade futuros) | 52,5% | 74,2 | 19% |
| **Inativos** (não operam) | 31,5% | 68,6 | 8% |
| **Bovespa** (ações, swing) | 16,0% | 59,5 | 19% |

> **1 em cada 3 clientes está inativo.** Isso é central: a base não é só "traders ativos". O maior segmento ativo (BM&F) é o mais satisfeito; o inativo é grande e recuperável.

---

## 2. Composição por estilo operacional (Projeto Persona) `[A] interno, datado`

| Estilo | % base | Como opera | LTV médio | Tempo de vida | Satisfação |
|---|---|---|---|---|---|
| **Análise Gráfica** | 56% | decide pelo gráfico | R$400,51 | 3,62 meses | 55,8% |
| **Análise Mista** | 16% | gráfico + tape reading | R$591,05 | 3,65 meses | 55,4% |
| **Traders de Ação** | 16% | ativos da Bovespa | R$465,10 | 4,8 meses | 47,9% |
| **Leitores de Fluxo** | 12% | SuperDOM/boletas + tape reading | R$1.048,66 | 5 meses | 56,4% |

> **Leitor de Fluxo é o cliente mais valioso** (LTV ~2,6× o Análise Gráfica) e o mais fiel, mas é o menor grupo (12%). **Análise Gráfica é a maioria absoluta (56%) e o de menor LTV.** Padrão: quanto mais sofisticada a operação, maior o LTV e a vida.

---

## 3. Demografia do público (agregado) `[A] interno, datado`

- **Idade:** média **40–43 anos**. BM&F mais distribuído abaixo de 40; Bovespa concentra acima de 40. Faixas quentes 30–44.
- **Família:** maioria **casada** (52–69% conforme recorte); **~55–65% têm filhos**; domicílios de 1–3 pessoas.
- **Escolaridade:** **60–88% com ensino superior completo** (mais alto nos Traders de Ação, 87,7%).
- **Geografia:** concentração **São Paulo** (14–21%), depois **RJ, Brasília, Curitiba, Belo Horizonte, Goiânia, Porto Alegre** — eixo Sudeste + Sul + capitais.
- **Profissões/áreas:** Administração/Negócios 27%, **Trader 17%**, Aposentado 15%, Engenharia 9,6%, Economia/Finanças 7%, Tecnologia 5,6%. (Empresário, func. público e autônomo recorrentes nos recortes.)
- **Interesse dominante:** **Economia e Finanças** destaca-se de longe (179 de ~340 respostas) — depois Tecnologia/Inovação (56), muito atrás.
- **Hobbies:** filmes/séries (25,9%), esportes (19,5% — caminhada/corrida, musculação, futebol), viajar (12,8%), ar livre, leitura, videogame. Música: Rock/Pop.

---

## 4. Motivação de entrada e "concorrentes" `[A] interno`

**Por que começou a operar** (varia por segmento, mas o núcleo é estável):
- **Complemento de renda / renda extra** e **"viver de mercado"** dominam em todos.
- **BM&F:** "viver de mercado" 51,8% · renda extra 31,9% · futuro/aposentadoria 12,2%.
- **Inativos:** renda extra 34,7% · viver de mercado 34,2% · futuro 24,7%.
- **Bovespa:** futuro/aposentadoria 34,8% · renda extra 32,6% · viver de mercado 28,5%.
- **"Ganho rápido de dinheiro" é sempre marginal (1,5–3,2%)** — o público **não** se declara movido por enriquecimento rápido; é renda/liberdade/futuro. (Importante para a copy e para compliance.)
- Gatilho macro citado (Traders de Ação): **35,1% entrou porque "os juros estavam muito baixos"**.

**Alternativas que disputam o mesmo objetivo** ("concorrentes indiretos"): mudança de carreira (37–47%), **renda fixa** (36–48%), renda variável, cripto (10–14%), jogos/apostas (2–6%). O objetivo do cliente é **renda/liberdade**, e o trading é **um** dos caminhos que ele compara — inclusive com largar o trading por outra carreira.

---

## 5. A dor central (convergência interna forte) `[B] interno`

- **Maior desafio declarado como trader = controle psicológico/emocional**, convergente em todos os perfis (47,7% · 50% · 55% · e 25,8% no recorte Traders de Ação). Segundo: **conhecimento de mercado** e **gestão de tempo**.
- Mapa de empatia (cliente atual) — **dores:** controle emocional, falta de tempo para operar, problemas com a plataforma, perder dinheiro. **Necessidades:** adquirir conhecimento (mercado + plataforma), atendimento claro e transparente, produto de alta performance.
- **Objetivos ainda NÃO alcançados:** a maioria responde *"não, sei que tenho um caminho a percorrer"*. **Atingiram seus objetivos: BM&F 14% · Inativos 20% · Bovespa 27%.** Até os **campeões de alto volume (BM&F): só 18%** se consideram realizados.

> **Implicação dura para compliance (GAP-003/DEC-010):** a própria base interna confirma que **"viver de trading" raramente se concretiza** (14–27% dizem ter atingido objetivos; o resto segue tentando). Qualquer copy de lançamento que prometa resultado contraria o dado da própria empresa. É munição para barrar promessa publicitária, não para alimentá-la.

---

## 6. Produto, conversão e canais `[A] interno`

- **Plataformas:** ProfitOne/Whitelabels e **ProfitPro** são o núcleo. Assinatura **Profit Pro**: BM&F **71%** · Bovespa **51%** · Inativos **28%**. "Assinam opcionais": ~5–9%. (Dado real de mix/upsell — ancora o modelo de assinatura do LaunchOS.)
- **Operação (personas):** BM&F ~**39 contratos/mês, 7 dias operando/mês, 99% freq. BM&F**; Bovespa ~**9 ordens/mês, 4 dias/mês, 98% freq. Bovespa**; Inativos ~0.
- **Percepção da tecnologia positiva, MAS a maioria já cogitou outra plataforma** (MetaTrader, Tryd, TradingView). Motivo de adoção do Profit: **qualidade/performance** (BM&F 49,2%) e **indicação** (corretora/influenciador/amigos).
- **Como conheceu o Profit:** indicação da corretora **34%** · **indicação de influenciador digital 33%** · indicação de amigos 11,9%. **99,7% sabem que a plataforma é da Nelogica.**
- **83,3% já fizeram algum curso de mercado financeiro** — público já é consumidor de educação/infoproduto financeiro (mercado aquecido, mas disputado).
- **Consumo de mídia:** **YouTube domina** (aprendizado 73,5%, entretenimento/notícias 38%); depois streaming, jornal/revista/livros. Redes: **Instagram, WhatsApp, Telegram**; Twitter/X relevante para notícias. Preferência de mídia nº1: **YouTube (21,8%)**.

---

## 7. Influenciadores que a base já segue `[A] interno` — mapa de parceiros potenciais

Dado estratégico direto para E0/E1 (achar expert para lançar): a própria base declara quem segue. Mais citados (contagem):
**Stormer (15), Claudinho Trader (15), Felipe Amorim (8), Wilson Neto (8), André Machado (7), André Moraes (5), Jefferson Laatus (5), Thiago Nigro (4), André Antunes (4)…** e dezenas na cauda longa.
Escolas/cursos mais citados: **André Machado (12), B.Trader (10), Academia Alta Renda (8), Atom, Hermann Greb, Rodnei Dias (6)…**

> **Uso:** candidatos a expert de lançamento (revenue share) saem desta lista — são nomes que **a audiência da Nelogica já reconhece**, reduzindo custo de aquecimento. Cruzar com HYP-005 (expert com autoridade não entra pelo semente). **Não** tratar a contagem como ranking de força comercial — é frequência numa amostra de 340, autodeclarada.

---

## 8. Personas oficiais da Nelogica `[A] interno`

Três personas finais (nov/2023), por segmento de produto:

| Persona (arquétipo) | Segmento | Idade | Vida (CLT mediano) | Ticket médio | Perfil |
|---|---|---|---|---|---|
| **Explorador / Pessoa comum** | BM&F | 39− | 13 meses | R$148 | day trader cauteloso, renda extra, dor = tempo/emocional/solidão |
| **Equilibrista / Sábio** | Bovespa | 40+ | 20 meses | R$115 | swing trader, foco aposentadoria/conforto, analítico |
| **Polvo / Multitarefas** | Inativo | 38 | 11 meses | R$76 | entrou por indicação, parou após perda, sonha voltar |

- **Arquétipos (autoidentificação):** Pessoa comum 33,6% · Explorador 20,5% · Sábio 8,2% · Criador 7,9% · Cuidador 7% · Herói 5,6%. (Útil para StoryBrand/mensagem — o cliente se vê como **pessoa comum e explorador**, não herói.)
- **Brand Persona "Noa"** (quem a Nelogica fala *como*, não o cliente): 35 anos, casado, 1 filho, TI, agente de suporte **e** trader; tom **próximo (não íntimo), empático, proativo**; transparência/conhecimento/clareza.

---

## 9. Diretrizes de comunicação da Nelogica (guard-rails) `[A] interno`

Relevante para E3/E6/E7 — se um lançamento usa marca/canais/base Nelogica, a copy respeita isto:

- **Tom de voz:** Claro e objetivo (formal) · Educacional (semi-informal) · Otimista (informal) · Solícito (informal). **"Quem fala é sempre a Nelogica"** (1ª pessoa do plural; nome próprio só em chat/telefone).
- **Gramática:** linguagem coloquial **com concordância e escrita corretas**. Gírias **só** do mercado financeiro (trader, bearish, bullish, posicionado, zerar, pregão).
- **Emojis:** não usar (exceção: espelhar cliente, de forma neutra).
- **Termos PROIBIDOS** (guard-rail de risco): *travamento, delay, lentidão, instabilidade da plataforma, erro, problemas na plataforma*; **não assumir culpa**; **não fazer promessas** ("não vai acontecer mais"); **não prometer prazo**; **não se comprometer com retorno**; não encerrar atendimento sem transparência.

> Os termos proibidos **reforçam o compliance do LaunchOS**: a cultura da casa já é "não prometer resultado/prazo". Uma copy de lançamento com promessa de ganho é dissonante da própria marca.

---

## 10. O que isto muda no LaunchOS (conexões)

| Achado | Estágio | Efeito |
|---|---|---|
| Ticket mensal real ~R$76–148; vida 3,6–20 meses (faixa); Profit Pro 28–71% | E5 (viabilidade) | Ancora premissas que eram `[D]` em **`[A] interno datado`** — resolve parcialmente GAP-002/DEC-011. Usar como *faixa de referência*, recalibrável. |
| 1/3 da base inativa; só 14–27% atingem objetivos | E3/E7 (oferta/compliance) | Público real ≠ "todo mundo vira trader de sucesso". Barra promessa; sugere oferta de recuperação de inativo. |
| Dor central = psicológico + tempo + conhecimento | E3/E4 (ângulo/oferta) | Ângulo de campanha e transformação prometida devem mirar disciplina/gestão emocional/tempo, não "fique rico". |
| Lista de influenciadores seguidos | E0/E1 (achar expert) | Candidatos a parceiro de lançamento que a audiência já reconhece. |
| Arquétipos: pessoa comum/explorador | E3/E6 (StoryBrand) | O cliente é o herói "pessoa comum"; a marca é o guia. Casa com SB7. |
| YouTube + indicação (corretora/influenciador) dominam aquisição | E6 (plano de canais) | Canal quente = indicação/influenciador + YouTube; não partir de tráfego frio genérico. |
| Guard-rails de comunicação (termos proibidos) | E6/E7 (copy) | Checklist de copy do lançamento herda os termos proibidos da Nelogica. |

> **Limite honesto:** estes dados descrevem a **base atual de clientes da Nelogica** (quem já usa o Profit), que é **próxima, mas não idêntica**, à audiência de um lançamento de infoproduto com influenciador (que inclui prospects frios). Transferir 1:1 é erro (parentes de GAP-010/GAP-012). Serve como **melhor âncora disponível**, com a ressalva de temperatura e data.
