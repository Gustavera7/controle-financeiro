# Folga

Sua folga do mês em um número: **quanto está livre para gastar** depois de cumprir a meta de guardar. Funciona com um país só e, para quem vive e ganha entre dois, com dois — mas só se você disser isso na conversa inicial.

**Privacidade:** este repositório contém apenas o código. Os dados financeiros ficam no `localStorage` do navegador de quem usa e, se você criar conta, na sua linha no Supabase — nada é compartilhado com anunciantes, bancos ou parceiros.

## Como funciona

1. **Conversa inicial** — o app pergunta onde você vive e quanto recebe, se tem renda em outro país (e, se tiver, se ela entra no seu "livre" ou fica reservada para investir), quanto já tem investido, onde quer chegar e quanto vai guardar por mês. Tudo ajustável depois em Metas e Config.
2. **Início** — o número grande é o livre do mês: renda − compromisso de guardar − gastos. Abaixo, quanto ganhou, guardou e gastou, para onde foi o dinheiro e o resumo do mês passado.
3. **Lançamentos** — um formulário só para gasto, renda extra e aporte. Gastos em *viagem a trabalho* nas categorias que a sua empresa cobre não descontam do livre (você escolhe quais em Config).
4. **Investir** — patrimônio com gráfico por tipo de ativo e alvo por perfil de risco, plano do mês (o que fazer com o dinheiro, nesta ordem, com valores), taxas do seu país e as taxas das suas próprias contas, histórico de aportes e oportunidades.
5. **Rewards** — leitura dos seus gastos: quanto volta hoje em cashback, quanto poderia voltar, e o que mudar em cada categoria. Ofertas de parceiros entram na conta automaticamente.

## Uso

App estático (HTML + JS puro, sem dependências, sem build). Abra `index.html` no navegador ou acesse a versão hospedada. Instalável como PWA no celular (funciona offline). Faça backups pelo botão **Exportar** na aba Config.
