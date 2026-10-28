# Artefato G — Glossário do Domínio

> Vocabulário consolidado das fontes, com ambiguidades sinalizadas. Base para o modelo de dados do SaaS (Artefato, a produzir). Onde as fontes usam o mesmo termo com sentidos diferentes, o conflito está marcado ⚠️.

## Modelos e fases

- **Lançamento digital** — campanha de vendas concentrada numa janela curta (carrinho que abre e fecha), para concentrar faturamento em vez de diluí-lo. Oposto e complementar do perpétuo.
- **Fórmula de Lançamento (FL)** — o **curso** de Érico Rocha (Ignição Digital), adaptação brasileira do Product Launch Formula. ⚠️ No uso coloquial virou sinônimo da *metodologia*; distinguir o produto comercial (curso) da estrutura de 4 fases.
- **Product Launch Formula (PLF)** — metodologia-raiz de Jeff Walker (livro *Launch*). Origem de quase tudo no corpus.
- **Perpétuo / Evergreen / Funil Perpétuo** — oferta sempre disponível, venda contínua. ⚠️ "Lançamento perpétuo" (SRC-001/002) é diferente: é a *mecânica de lançamento automatizada por lead* (urgência individual), não o evergreen puro. Dois conceitos sob nomes parecidos.
- **Pré-pré-lançamento / Captação** — fase 0: construir e aquecer a lista.
- **Pré-lançamento / Aquecimento** — fase 1: entregar valor via CPLs, preparar a decisão.
- **Carrinho aberto / Lançamento** — fase 2: oferta disponível por tempo limitado.
- **Fechamento / Pós-lançamento** — fase 3: encerrar, entregar, recuperar, transicionar.

## Tipos (ver divergência na matriz 03)

- **Semente** — vender a 1ª turma de um produto ainda não construído, audiência pequena, baixo risco. ⚠️ "Hiper-semente" (SRC-008) = variação sem definição clara.
- **Interno** — venda dentro da própria audiência + captada, sem parceiros.
- **Externo** — usa audiência de terceiros (afiliados/coprodutores) por comissão. ⚠️ "Lançamento afiliado" às vezes é listado à parte, às vezes é subtipo de externo.
- **Relâmpago** — campanha curta e intensa (24–72h; Hotmart diz 2–10d ⚠️) para base quente.
- **Relançamento** — repetir um lançamento para a base, com ângulo/bônus novo.
- **Desafio (challenge)** — aquecimento ativo: participantes executam tarefas por dias; oferta vem como próximo passo. Pode ser gratuito ou pago.
- **Espartano** — citado só por Neil Patel; sem definição no corpus. Não tratar como categoria até validar.

## Pessoas e papéis

- **Influenciador / Especialista / Expert** — quem tem autoridade e audiência; a "cara" do produto. ⚠️ As fontes usam como sinônimos, mas há diferença útil: *especialista* enfatiza autoridade técnica; *influenciador* enfatiza audiência. Para diagnóstico, são eixos distintos (um pode ter um sem o outro).
- **Lançador (lançador digital)** — profissional/agência que opera o lançamento para o expert, frequentemente em coprodução/revenue share (SRC-014; artigo Hotmart dedicado). **Papel central para o projeto do Davi.**
- **Coprodutor** — sócio da entrega/operação (não só divulgador), com split de receita.
- **Afiliado** — divulga por comissão, sem ser sócio da entrega.
- **Lead** — contato capturado (e-mail/telefone) que entrou na lista.
- **Avatar / Persona** — representação do cliente ideal. Primeira tarefa da operação; dificuldade nº 1 relatada pelos praticantes (SRC-017).
- **Audiência** — conjunto de seguidores/base. ⚠️ Não confundir com lista (capturada) nem com intenção de compra (ver GAP-005).

## Oferta e conversão

- **Oferta** — o pacote: produto + preço + garantia + bônus + razão para agir agora. "O coração; página bonita não salva oferta fraca" (SRC-001).
- **Produto / Infoproduto** — conteúdo digital (curso, e-book, mentoria, webinar).
- **MVP (produto mínimo viável)** — versão inicial para testar viabilidade com baixo investimento (SRC-009).
- **Escada / Esteira de valor** — sequência de ofertas de ticket crescente.
- **CPL** ⚠️ **ambiguidade dupla crítica:** (1) **Conteúdo de Pré-Lançamento** (as aulas de aquecimento); (2) **Custo Por Lead** (métrica). Mesma sigla, sentidos totalmente diferentes. O SaaS precisa desambiguar por contexto ou renomear um deles.
- **Carrinho** — o checkout/janela de compra. "Abrir/fechar o carrinho" = iniciar/encerrar vendas.
- **Isca digital / Lead magnet** — material gratuito que atrai o cadastro.
- **Página de captura** — coleta o e-mail. **Página de vendas** — apresenta a oferta. **VSL** — vídeo de vendas.
- **Order bump / Upsell / Downsell / Cross-sell** — ofertas adicionais (no checkout / após compra / alternativa mais barata / complementar).
- **Gatilhos mentais** — escassez, urgência, prova social, autoridade, reciprocidade (base: Cialdini). ⚠️ Linha tênue com manipulação quando a escassez é falsa.
- **Escassez honesta** — prazo/vagas/bônus reais. Oposto da escassez falsa (timer que "zera" e nada muda). Princípio de sustentabilidade (SRC-001).

## Financeiro (ver 06 para fórmulas)

- **Faturamento / Receita bruta** — total vendido. ⚠️ **Não é lucro nem caixa.** Erro de interpretação mais comum do mercado.
- **Receita líquida** — bruto − reembolsos − taxas.
- **Lucro** — o que sobra após todos os custos e divisões.
- **Margem de contribuição** — receita − custos variáveis. Pouco tratada nas fontes (GAP).
- **"6 em 7"** — jargão: faturar 6 dígitos (R$100k+) em 7 dias. Meta de **receita bruta**, não resultado típico.
- **Reembolso** — devolução dentro da garantia (padrão 30 dias). Reduz receita líquida.
- **Ticket** — preço pago por cliente.
- **Revenue share / Split** — divisão de receita entre partes (expert, lançador, infra). Estrutural no modelo do Davi.

## Termos a padronizar no SaaS (decisão de modelagem pendente)

- Resolver a colisão **CPL (conteúdo) × CPL (custo)**.
- Decidir se **expert/influenciador/especialista** são um campo com atributos ou entidades distintas.
- Decidir se os **tipos de lançamento** são enum fechado (5 núcleo) + tags, conforme recomendado em 03.

## Termos de GTM / aquisição (SRC-018 — contexto B2B, aplicabilidade parcial)

> Adicionados de SRC-018 (infográfico de GTM B2B, 2026-10-28). Vocabulário **de contexto B2B** — marcar como tal. A transferência para lançamento B2C de infoproduto é hipótese (HYP-006 / GAP-010), não regra.

- **GTM (Go-to-Market)** — estratégia de como levar um produto ao mercado: canais, mensagem, aquisição. Mais amplo que "lançamento", que é uma campanha dentro do GTM.
- **AEO (Answer Engine Optimization)** — otimizar para ser **citado por mecanismos de IA** (ChatGPT, Perplexity, Gemini), não só por buscadores. Implica conteúdo aberto (a IA não cita PDF atrás de formulário) e afirmações citáveis (números, nomes). Canal de awareness que o corpus de lançamento ignora → HYP-006.
- **Sinais de intenção (intent signals)** — eventos que indicam prontidão de compra. Em B2B: contratação, rodada de investimento, mudança de emprego, visita à página de preços. ⚠️ Em B2C/infoproduto os sinais seriam outros (lista de espera, engajamento, recompra) — não mapear 1:1 (GAP-010).
- **Fidelização / expansão / indicação** — transformar cliente em fonte do próximo ciclo (comunidade, cases, indicação remunerada, upsell). Cobre a lacuna GAP-009 do corpus.
- **BOFU (bottom of funnel / fundo de funil)** — conteúdo/páginas para quem já tem intenção (preço, comparativo, demo).
