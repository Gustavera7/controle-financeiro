# Folga — material para as lojas (Play Store / App Store)

Tudo aqui está pronto para copiar e colar. Atualizado em 15/08/2026.

---

## 1. Identidade

| Campo | Valor |
|---|---|
| Nome | **Folga** |
| Nome longo (PT) | Folga — quanto está livre este mês |
| Nome longo (EN) | Folga — how much is free this month |
| Package Android (sugestão) | `app.folga.twa` |
| Bundle ID iOS (sugestão) | `app.folga.ios` |
| Categoria | Finanças (secundária: Produtividade) |
| Classificação etária | Livre / 4+ (sem conteúdo sensível, sem compras no app) |
| Site | https://gustavera7.github.io/controle-financeiro/ |
| Privacidade | https://gustavera7.github.io/controle-financeiro/privacy.html |
| Suporte | gustavodasilveira2018@gmail.com |

---

## 2. Textos — Português

**Subtítulo / descrição curta (máx. 80 caracteres):**
> Um número por mês: quanto você pode gastar sem furar suas metas.

**Descrição longa:**

> **Quanto eu posso gastar este mês sem me sabotar?**
>
> O Folga responde essa pergunta com um número grande na tela inicial — e mais nada para você decifrar.
>
> Você conta ao app, uma vez só, quanto ganha, quanto quer guardar por mês e onde quer chegar. A partir daí, cada gasto que você registra desconta desse número. O que sobra é seu: jantar fora, viagem, aquela compra — sem culpa, porque sua meta já foi separada antes.
>
> **Como funciona**
> • Assistente inicial que conversa com você e monta seu plano em 1 minuto
> • Tela inicial com um número: o que está livre para gastar hoje
> • Lançamento rápido de gastos, renda extra e aportes
> • Relatório mensal automático: para onde foi o dinheiro, comparação com o mês anterior, projeção da sua meta
> • Acompanhamento de patrimônio e ritmo de aportes
> • Cotações de mercado ao vivo (dólar, Selic, CDI, IPCA, Bitcoin)
> • Ideias de economia e de renda extra segura
> • Sincroniza entre celular e computador
> • Funciona offline
>
> **Feito para quem vive entre dois países**
> Ganha em mais de uma moeda? O Folga mantém a renda estrangeira separada do dia a dia, destinada a investimentos — sem bagunçar seu orçamento local. Quem tem só uma renda simplesmente pula essa etapa.
>
> **Privacidade de verdade**
> Sem conexão com banco. Sem anúncios. Sem rastreadores. Seus dados ficam no seu aparelho e, se você quiser, numa área privada da nuvem que só você acessa.
>
> O Folga é uma ferramenta de organização e informação educacional — não é recomendação de investimento.

**Palavras-chave:** orçamento, finanças pessoais, controle de gastos, metas, economia, dinheiro, investimentos, expatriado, quinzenal, poupança

---

## 3. Textos — English

**Subtitle / short description (max 80 chars):**
> One number a month: what you can spend without breaking your goals.

**Long description:**

> **How much can I spend this month without sabotaging myself?**
>
> Folga answers that with one big number on the home screen — and nothing else to decode.
>
> You tell the app once how much you earn, how much you want to save each month and where you want to get. From then on, every expense you log subtracts from that number. Whatever remains is yours: dinner out, a trip, that purchase — guilt-free, because your goal was already set aside first.
>
> **How it works**
> • A friendly setup assistant that builds your plan in about a minute
> • A home screen with a single number: what's free to spend today
> • Fast logging of expenses, extra income and investment contributions
> • Automatic monthly report: where money went, month-over-month comparison, goal projection
> • Wealth tracking and contribution pace
> • Live market rates (USD, Bitcoin and Brazilian Selic, CDI, IPCA)
> • Savings ideas and safe extra-income ideas
> • Syncs between phone and computer
> • Works offline
>
> **Built for people living between two countries**
> Earning in more than one currency? Folga keeps foreign income separate from daily spending, earmarked for investing — without polluting your local budget. If you have a single income, you simply skip that step.
>
> **Real privacy**
> No bank connection. No ads. No trackers. Your data stays on your device and, if you choose, in a private cloud area only you can access.
>
> Folga is an organization and educational information tool — not investment advice.

**Keywords:** budget, personal finance, expense tracker, savings goals, money manager, spending, investing, expat, paycheck, free to spend

---

## 4. Declaração de dados (Data Safety / App Privacy)

Responda assim nos formulários das lojas:

| Pergunta | Resposta |
|---|---|
| Coleta dados? | Sim — apenas e-mail (conta) e os dados financeiros que o usuário digita |
| Dados são compartilhados com terceiros? | **Não** |
| Dados são usados para publicidade/rastreamento? | **Não** |
| Dados criptografados em trânsito? | **Sim** (HTTPS/TLS) |
| Usuário pode pedir exclusão? | **Sim** (por e-mail; exportação disponível no app) |
| Tipos declarados | E-mail (autenticação) · "Outras informações financeiras do usuário" (dados inseridos manualmente) |
| Dados são obrigatórios? | Não — o app funciona sem conta, 100% local |

**Apple — App Tracking Transparency:** não aplicável (o app não rastreia).

---

## 5. O que ainda falta (só você pode fazer)

### Play Store (Android)
1. Criar conta no [Google Play Console](https://play.google.com/console/signup) — **taxa única US$ 25**
2. **Atenção:** contas pessoais criadas depois de 2023 precisam de **teste fechado com 12 testadores por 14 dias** antes da publicação aberta. Vale já ir juntando os 12 e-mails (amigos, colegas, família).
3. Verificação de identidade (documento) — leva alguns dias
4. Eu gero o pacote Android (TWA) assim que a conta existir

### App Store (iOS)
1. Conta [Apple Developer](https://developer.apple.com/programs/) — **US$ 99/ano**
2. Precisa de um Mac (ou serviço de build em nuvem) para compilar
3. Risco conhecido: a diretriz 4.2 da Apple rejeita apps que sejam "só um site". O Folga tem login, offline, dados ao vivo e relatórios — ajuda, mas não elimina o risco.
4. **Enquanto isso:** no iPhone o Folga já instala pelo Safari → Compartilhar → Adicionar à Tela de Início

### Requisito técnico do TWA (Android)
Para o app abrir sem barra de navegador, o Android exige o arquivo `assetlinks.json` na **raiz do domínio** — hoje o site vive em `gustavera7.github.io/controle-financeiro/`, que é subpasta. Duas saídas:
- **A (grátis):** criar o repositório `gustavera7.github.io` e servir o app na raiz
- **B (recomendada):** registrar o domínio **folga.app** (~US$ 15/ano) e apontar para o GitHub Pages — melhor para a marca e para as lojas

### Materiais gráficos que eu gero quando decidirmos
- Ícone 512×512 (já existe, dá para refinar)
- Feature graphic 1024×500 (Play)
- Screenshots do celular (mínimo 2 por idioma; recomendo 4)

---

## 6. Checklist de prontidão

- [x] App funcional e publicado na web
- [x] PWA instalável, offline, com manifest completo
- [x] Login e sincronização entre aparelhos
- [x] Interface em português e inglês
- [x] Onboarding que serve para qualquer usuário (com ou sem segunda renda)
- [x] Política de privacidade publicada (PT/EN)
- [x] Textos de listing PT/EN
- [x] Respostas do formulário de segurança de dados
- [ ] Conta Google Play (US$ 25) — *Gustavo*
- [ ] 12 testadores para o teste fechado — *Gustavo*
- [ ] Domínio próprio ou repositório na raiz — *decidir*
- [ ] Conta Apple Developer (US$ 99/ano) — *Gustavo, se for para iOS*
- [ ] Screenshots e feature graphic — *eu gero*
- [ ] Pacote Android (TWA) — *eu gero após a conta existir*
