# Folga — guia para continuar o projeto

App pessoal de finanças. Um número guia tudo: **quanto está livre para gastar este mês**.
Dono/usuário: Gustavo (Bettendorf, IA — assignment de 2 anos na John Deere). Uso próprio
agora; a intenção é vender como serviço depois de um período de teste pessoal.

## Arquitetura em uma frase

`index.html` é o app inteiro — HTML + CSS + JS puro, ~2100 linhas, **sem build, sem
dependências, sem framework**. Não introduza bundler, npm ou framework: a simplicidade é
o que mantém o custo zero e o deploy instantâneo.

| Arquivo | Papel |
|---|---|
| `index.html` | Todo o app (estilos, i18n, lógica, telas) |
| `sw.js` | Service worker — offline e atualização automática |
| `manifest.webmanifest` | Identidade do PWA (instalação no celular) |
| `privacy.html` | Política de privacidade bilíngue (exigida pelas lojas) |
| `STORE.md` | Textos e checklist prontos para Play Store / App Store |
| `supabase-schema.sql` | Schema da tabela `app_state` (sync entre aparelhos) |

## Regras que não podem ser quebradas

1. **Ao publicar, incremente `CACHE` em `sw.js`** (`cf-v11` → `cf-v12`). Sem isso, quem já
   usa continua vendo a versão antiga.
2. **Toda string nova entra nas DUAS tabelas de idioma** (`I18N.pt` e `I18N.en`, em
   `index.html`). Valores podem ser função: `t("chave", arg)`. Conteúdo estruturado usa
   `{pt, en}` + helper `L()`.
3. **Nada de país ou moeda fixo no código.** O app tem um país principal (onde a pessoa
   vive e gasta) e, *só se ela declarar na conversa inicial*, um segundo país de onde vem
   outra renda. Quem responde "não" nunca vê seletor de moeda, câmbio ou segunda renda.
   O que entra no "livre" é a política `freePolicy` (`"main"` = só a renda principal,
   padrão; `"all"` = as duas somadas) — o caso do Gustavo é uma configuração, não uma regra.
4. **Gasto de viagem a trabalho em categoria coberta não desconta do livre.** Continua
   sendo a regra central; agora `travelCovered` e `coveredCats` são do usuário (Config).
   Extras pessoais durante viagem de trabalho descontam normalmente.
5. **Nunca criar contas nem inserir credenciais pelo Gustavo** — ele cria as próprias
   contas (Supabase, Google Play, etc.).
6. **`DEFAULTS` fica zerado** — nenhum dado pessoal no código. Usuário novo cai no wizard.
   Taxas de banco específico também não: o usuário cadastra as dele em "Minhas contas".
7. **O wizard só abre por `wizardIfNeeded()`, depois da resposta da nuvem.** Se abrir antes,
   quem já tem metas salvas e entra num aparelho novo é perguntado de novo. Bug já corrigido
   uma vez — não reintroduzir.
8. **Mês sem lançamento não gera "livre fantasma"** — use `monthHasData()` / `firstDataMonth()`
   antes de exibir números de um mês vazio. Vale também para médias: só conte meses com dados.
9. **Todo estado que entra no app passa por `migrate()`** — localStorage, nuvem e backup
   importado. Ela é idempotente e é o único lugar que conhece formatos antigos.

## Dados externos (ao vivo)

Cotações e índices vêm de APIs públicas com CORS liberado, sem chave: **AwesomeAPI** (par
`MOEDA1-MOEDA2` do usuário, que alimenta o câmbio automático), **CoinGecko** (Bitcoin) e
**BCB SGS** (séries 432 Selic, 4389 CDI, 13522 IPCA — só buscadas se o Brasil for um dos
países). O que não tem API vira faixa de mercado no `PLAYBOOK`, com `RATES_ASOF` marcando a
data da pesquisa; ao atualizar os números, atualize a data.

## Como o dinheiro é representado

- **Moeda principal** (`homeCur`): o dia a dia. Gastos são sempre nela.
- **Segunda moeda** (`secondCur`): só existe com `hasSecond`. `fx` = quantas unidades dela
  valem 1 da principal.
- **Moeda do patrimônio** (`wealthCur`): onde a pessoa conta meta e investimentos (o
  Gustavo conta em R$ morando nos EUA). Trocá-la converte os valores guardados.
- Formatadores: `fmtM/fmtM0` (principal), `fmtS0` (segunda), `fmtW0` (patrimônio),
  `fmtCur(v, código)` para qualquer outra. Conversão só por `conv/toMain/toWealth`.

## Dados

- `localStorage["controle-financeiro-v2"]` (migra da `v1` automaticamente).
- Sync opcional entre aparelhos via **Supabase** (last-write-wins por `_ts`; pull ao abrir
  e ao focar, push com debounce no save). A anon key no `index.html` é pública por design —
  a segurança está no RLS da tabela `app_state`.
- Backup manual: botão **Exportar** na aba Config.

## Publicar

```bash
git add -A && git commit -m "..." && git push origin main
```

GitHub Pages publica em ~1 minuto → https://gustavera7.github.io/controle-financeiro/
O app se atualiza sozinho no aparelho (procura versão nova a cada abertura e recarrega uma
vez quando ela assume). **Verifique no ar antes de dizer que está pronto** — o `curl` do
HTML publicado deve conter a mudança.

## Como testar

Não existe suíte de testes. O caminho que funciona:

1. `python -m http.server 8734` na pasta (já configurado em `.claude/launch.json`).
2. Abrir no navegador em viewport de celular (375px) e medir via JavaScript: overflow
   horizontal deve ser 0, controles ≥44px, inputs em 16px (senão o iOS dá zoom).
3. Console sem erros.
4. Exercitar o fluxo de verdade: wizard de metas → lançar gasto pessoal → lançar gasto de
   viagem a trabalho (não pode descontar) → conferir o número do livre.

## Telas

`inicio` · `lanc` (lançamentos) · `invest` · `ideias` · `relatorio` · `rewards` · `metas` · `config`

As três primeiras são as do hábito diário e devem permanecer **limpas**; profundidade vai
nas telas secundárias. Gustavo rejeitou uma versão anterior por ter módulos demais na
entrada — clareza vence completude. **Não crie abas novas**: profundidade nova vira folha
(`#sheet`), como o detalhe do patrimônio (`openWealth()`).

Blocos que só aparecem para quem eles servem: guia de benefícios e preço de combustível
(EUA), índices brasileiros (Brasil), avisos de visto (`visaNotes`), tudo de segunda moeda
(`hasSecond`). Ao criar conteúdo regional, marque com `only: ["US"]` / `needsSecond` /
`needsVisa` em vez de mostrar para todo mundo.

## Peças novas que valem conhecer

- **`renderPlan()`** — o "Plano do mês": transforma os números em passos com valor e
  destino (dívida → reserva → compromisso → segunda renda → sobra → rebalanceamento).
  Substituiu o checklist; itens que o app não verifica sozinho seguem com marcação manual
  em `S.checklist[mês]`.
- **`renderWealthSheet()`** — patrimônio por tipo de ativo, com rosca em SVG puro
  (`donut()`), alvo por perfil de risco (`RISK_TARGETS`) e conferência contra os
  lançamentos.
- **`rewardsInsights()`** — cruza gasto médio por categoria com cartões (`S.rewards`) e
  ofertas (`S.offers`); `CAT_BENCH` são faixas típicas de mercado, nunca ofertas do Folga.
- **`S.offers`** — formato pensado para o futuro feed de parceiros (parceiro, categoria,
  % extra, validade). Hoje o próprio usuário cadastra.

## Pendências conhecidas (antes de vender para outras pessoas)

- Ofertas de parceiro são locais; falta o feed (e o contrato comercial por trás dele).
- Gastos são sempre na moeda principal — quem gasta nos dois países ainda não tem isso.
- O guia de benefícios, quando aparece, ainda cita lojas do Meio-Oeste dos EUA.
- Play Store via TWA exige `assetlinks.json` na **raiz do domínio** — o endereço atual
  (`/controle-financeiro/`) não permite; precisa de um repo `gustavera7.github.io` ou
  domínio próprio.
