# Meu Dinheiro — Clareza mensal

App pessoal de finanças para uma temporada de trabalho nos EUA. Um número guia tudo: **quanto está livre para gastar este mês** depois de cumprir a meta de guardar.

**Privacidade:** este repositório contém apenas o código. Todos os dados financeiros ficam no `localStorage` do navegador de quem usa — nada é enviado a servidor algum.

## Como funciona

1. **Conversa de metas** — na primeira abertura o app pergunta: renda EUA, renda Brasil, quanto já tem investido, onde quer chegar e até quando, e quanto vai guardar por mês. Tudo ajustável depois na aba Metas.
2. **Início** — o número grande é o livre do mês: renda − compromisso de guardar − gastos. Abaixo, quanto ganhou, guardou e gastou, para onde foi o dinheiro e o resumo do mês passado.
3. **Lançamentos** — um formulário só para gasto, renda extra e aporte. Gastos de combustível, comida e carro alugado em *viagem a trabalho* são cobertos pela empresa e não descontam do livre.
4. **Investimentos** — patrimônio vs. meta, composição da carteira, histórico de aportes e lista de oportunidades (avaliando / investido / descartado).
5. **Rewards** — guia de programas de benefícios (clubes e mercados das Quad Cities, redes nacionais de combustível, milhas aéreas, delivery), melhor cartão por categoria e comparador de preço por posto.

## Uso

App estático (HTML + JS puro, sem dependências). Abra `index.html` no navegador ou acesse a versão hospedada. Instalável como PWA no celular (funciona offline). Faça backups pelo botão **Exportar** na aba Config.
