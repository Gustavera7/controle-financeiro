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

1. **Ao publicar, incremente `CACHE` em `sw.js`** (`cf-v10` → `cf-v11`). Sem isso, quem já
   usa continua vendo a versão antiga.
2. **Toda string nova entra nas DUAS tabelas de idioma** (`I18N.pt` e `I18N.en`, em
   `index.html`). Valores podem ser função: `t("chave", arg)`. Conteúdo estruturado usa
   `{pt, en}` + helper `L()`.
3. **"Livre para gastar" usa só o salário dos EUA.** A renda do Brasil fica à parte,
   destinada a aportes — decisão explícita do Gustavo, não é bug.
4. **Gasto de viagem a trabalho nas categorias combustível, comida e carro alugado é
   coberto pela empresa e não desconta do livre.** Extras pessoais durante viagem de
   trabalho descontam normalmente. Essa é a regra central do app.
5. **Nunca criar contas nem inserir credenciais pelo Gustavo** — ele cria as próprias
   contas (Supabase, Google Play, etc.).
6. **`DEFAULTS` fica zerado** — nenhum dado pessoal no código. Usuário novo cai no wizard.

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
entrada — clareza vence completude.

## Pendências conhecidas (antes de vender para outras pessoas)

- Moeda principal está fixa em USD.
- As abas Investir/Rewards são específicas do Gustavo (Empeople, Quad Cities, visto L-1).
- Play Store via TWA exige `assetlinks.json` na **raiz do domínio** — o endereço atual
  (`/controle-financeiro/`) não permite; precisa de um repo `gustavera7.github.io` ou
  domínio próprio.
