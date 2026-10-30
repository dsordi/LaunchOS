# Revisão de prontidão — LaunchOS como ferramenta de marketing de uma empresa US$ 2,2 bi

**Data:** 2026-10-30 · **Escopo:** app `app/index.html` (v1.4/artifact v35) + base `biblioteca/` · **Autor:** Claude (Opus 4.8), a pedido do Davi
**Natureza:** auditoria crítica, sem suavização. Marcas de confiança como no resto da base (`[A]` fato · `[B]` convergência · `[C]` inferência · `[D]` premissa não validada).

---

## 1. Veredito direto

**Hoje, NÃO.** O LaunchOS **não está** em condição de ser a **principal** ferramenta de marketing de uma empresa de US$ 2,2 bi. **Está**, e com folga, em condição de ser um **instrumento de decisão e padronização de método** (go/no-go de lançamento, disciplina de premissas, apoio a board) — que é coisa diferente e valiosa.

A distância entre o que ele é e "ferramenta principal" não é de acabamento visual (isso está bom). São **três blocos**, em ordem de gravidade:

1. **Os números não foram validados num caso real.** Conversão, churn, opt-in e CAC são premissas `[D]`. Sem um piloto fechado, a projeção é uma calculadora de hipóteses bem-feita — não uma previsão. (GAP-002; regra do próprio método: "método sem caso real é decoração".)
2. **Compliance de renda variável é lacuna aberta.** Para uma empresa que toca mercado financeiro, isso é **bloqueio**, não detalhe. Nenhuma fonte do corpus cobre regra de promessa publicitária/CVM. (GAP-003.)
3. **Arquitetura é de ferramenta individual, não de sistema corporativo.** Arquivo único, dados no navegador (localStorage), sem backend, sem login, sem multiusuário, sem trilha de auditoria. Para "ferramenta principal" de uma companhia desse porte, falta a camada de **sistema de registro**.

Nenhum dos três é fatal. Todos são endereçáveis. Mas enquanto existirem, chamar isto de "ferramenta principal" seria vender além do que se sustenta.

---

## 2. O que já está board-grade (pontos fortes reais)

- **Determinismo.** Não há IA em runtime: mesmo input → mesmo output. O motor **não inventa número**. Para levar a um board, isso é uma força enorme — é auditável e reproduzível, ao contrário de um copiloto generativo. `[A]`
- **Motor financeiro auditado.** Conservação do split, identidade do lucro, LTV:CAC de **margem** (não receita bruta), break-even do **operador** por bisseção, cascata de recuperação do aporte antes do split. Tudo verificado em harness repetível. (DEC-026, DEC-034.) `[A]`
- **Honestidade embutida.** Todo número é marcado como premissa `[D]`; faturamento ≠ caixa ≠ lucro ≠ margem; "receita contratada" ≠ "faturamento realizado". O app desencoraja ativamente a confundir projeção com resultado. Isso é raro e é exatamente o que protege a reputação num board.
- **Rastreabilidade de origem.** Cada recomendação carrega fonte e grau de confiança. A base distingue eco (Walker→Érico) de fonte independente (B3/ANBIMA, interno Nelogica).
- **Dimensionamento bottom-up com teto real.** Usa números da B3 (`[A]`, 2025–26) para barrar TAM inflado. (DEC-025.)
- **Correção recém-aplicada** da base fria (DEC-047) mostra que o motor é mantido com disciplina: diagnóstico → aprovação → execução → reauditoria.

---

## 3. Riscos e limitações, por categoria

### A. Validação dos números — **o maior risco** `[D]` → precisa virar `[A]`
- Conversão (`convLista`), churn por plano, opt-in da audiência e **opt-in da base fria** (novo, DEC-047) são todos premissas. O motor é correto; os **insumos** não foram observados num lançamento real.
- Não existe benchmark público auditável de faturamento por tipo de lançamento (GAP-002). Os "casos de R$X milhões" são pontos de ponta, não média.
- **Consequência:** a saída é tão boa quanto o chute de entrada. Num board, isso precisa ser dito em voz alta — e será, porque o app já marca `[D]`.
- **Como fechar:** rodar **um** caso piloto ponta a ponta (E0–E8) e reconciliar previsto × realizado. É o insumo de maior valor que existe hoje, e só o Davi destrava.

### B. Compliance / CVM / renda variável — **bloqueio condicional** (GAP-003)
- Nenhuma fonte cobre regra de promessa publicitária para produto de mercado financeiro.
- O app já faz o certo no nível de **copy** (bloqueia promessa de ganho, traduz para "competência/processo"), mas isso é higiene de redação, **não** parecer jurídico.
- Para uma empresa de mercado financeiro usar isto como ferramenta principal, falta a camada de **regra de compliance validada por jurídico/CVM**, por tipo de produto. Flag por oportunidade já existe (DEC-010); o conteúdo da regra, não.
- **Como fechar:** fonte jurídica/regulatória primária + revisão do jurídico interno. Até lá, toda campanha que toca RV sai com ressalva.

### C. Proveniência do conhecimento de método — mono-linhagem
- 13 das 14 fontes originais de **método de lançamento** derivam de Walker (PLF) → Érico (FL). Convergência entre elas é **eco**, não validação independente (DEC-006).
- Mitigado no lado de **mercado/audiência** (B3/ANBIMA/Nelogica independentes) e no lado de **copy/venda/psicologia** (Sugarman, SPIN, Challenger, Kahneman, etc.). Mas a **espinha do método de lançamento** ainda é uma escola só.
- **Consequência:** baixo risco para um board (a mecânica de lançamento é consensual no mercado), mas não se deve apresentar "convergência de 14 fontes" como prova — é uma fonte ecoada 14 vezes.

### D. Arquitetura de software e governança de dados — ferramenta individual, não sistema corporativo
- **Arquivo único HTML + localStorage.** Os dados vivem **no navegador de quem usa**: não há backend, não há banco, não há sincronização. Limpar o cache = perder os dados. `[A]`
- **Sem autenticação, sem multiusuário, sem controle de acesso, sem trilha de auditoria.** Qualquer pessoa com o link e o navegador tem o estado local dela, isolado.
- **Sem versionamento de dados nem backup.** Não há "quem mudou o quê, quando".
- **Sem testes automatizados em CI.** As auditorias existem como scripts, mas rodam à mão; não há porta que barre um commit que quebre o motor.
- **Consequência:** perfeitamente adequado como **ferramenta de análise/decisão de um usuário ou de um board**. **Inadequado** como **sistema de registro** corporativo (onde moram os dados reais de campanhas, com várias pessoas, auditoria e continuidade). Para ser "a principal ferramenta", essa camada precisa existir — ou o papel precisa ser redefinido como "o motor de decisão", com o registro morando noutro lugar.

### E. Robustez numérica
- Guardas contra divisão por zero e normalização de split que não soma 100 já existem (DEC-026). `[A]`
- Falta: validação sistemática de input (nada impede digitar valores incoerentes), e cobertura de teste em CI. `[C]`

### F. "Conhecimento aplicado" — o que é e o que não é
- O motor de conhecimento (DEC-044) **roteia** o conhecimento certo por contexto, com fonte. É consistente e rastreável.
- Mas é **roteamento por regra/template**, não análise causal nem aprendizado. Ele não "descobre" — ele aplica o que a base já tem, no lugar certo. Isso é honesto e suficiente para apoio à decisão; não confundir com inteligência que prevê resultado.

---

## 4. Checklist para virar "ferramenta principal" (priorizado)

| # | O que falta | Gravidade | Quem destrava |
|---|---|---|---|
| 1 | **Caso piloto real** fechado (E0–E8) + reconciliação previsto × realizado | Crítica | Davi (decisão de negócio) |
| 2 | **Camada de compliance/CVM** validada por jurídico, por tipo de produto | Crítica (p/ RV) | Jurídico Nelogica + fonte regulatória |
| 3 | **Dados internos reais** (conversão, churn, CAC, reembolso) para calibrar `[D]`→`[A]` | Alta | Nelogica (liberar dados) |
| 4 | **Backend + persistência + multiusuário + auditoria** (se for sistema de registro) | Alta (p/ escala) | Decisão de produto/engenharia |
| 5 | **Testes do motor em CI** (barrar regressão financeira) | Média | Engenharia |
| 6 | Validação de input no formulário | Baixa | Engenharia |

---

## 5. Recomendação de uso — hoje

**Use como:** motor de decisão go/no-go de lançamento; padronizador do método (todo mundo decide com o mesmo rigor); disciplinador de premissas (força separar projeção de resultado); material de apoio a board **com as ressalvas que ele mesmo imprime**.

**NÃO use ainda como:** fonte única de verdade operacional; instrumento que "promete" faturamento; decisor de compliance; sistema corporativo de registro de campanhas multiusuário.

**Frase para o board, honesta:** *"É um motor determinístico e auditado que transforma premissas em um go/no-go rastreável. Os números são premissas marcadas, não previsão — e serão calibrados no primeiro caso real. Antes de rodar em renda variável, passa pelo jurídico."* Isso se sustenta. Qualquer coisa além disso, hoje, não.

---

*Referências cruzadas: DEC-006 (origem única), DEC-010 (flag RV), DEC-011 (dados internos), DEC-026 (auditoria do motor), DEC-034 (cascata/split), DEC-044 (motor de conhecimento), DEC-047 (correção da base fria), GAP-002 (benchmark/piloto), GAP-003 (compliance).*
