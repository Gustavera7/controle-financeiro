# Controle Financeiro — Temporada EUA

App pessoal de controle financeiro para uma temporada de trabalho nos EUA, com ciclo de pagamento quinzenal.

**Privacidade:** este repositório contém apenas o código. Todos os dados financeiros ficam no `localStorage` do navegador de quem usa — nada é enviado a servidor algum.

## Funcionalidades

- **Dashboard quinzenal** — saldo disponível em tempo real, alinhado ao ciclo de pagamento de 14 dias, com fechamento automático de cada quinzena e histórico de sobras.
- **Gastos por tipo de viagem** — gastos de combustível, alimentação e carro alugado em *viagem a trabalho* são cobertos pela empresa e não contam no orçamento pessoal; extras pessoais e viagens de lazer contam normalmente.
- **Renda** — rendas extras entram na quinzena da data; aumentos de salário valem a partir de uma data sem alterar o histórico.
- **Comparador Brasil × EUA** — INSS, IRRF e FGTS calculados sobre o salário brasileiro vs. líquido americano convertido.
- **Investimentos** — carteira, meta com acompanhamento de ritmo de aportes, divisão configurável do excedente e lista de oportunidades.
- **Rewards** — guia de programas de benefícios (clubes, combustível, milhas, delivery), melhor cartão por categoria e comparador de preço de combustível por posto.

## Uso

É um app estático (HTML + JS puro). Abra `index.html` no navegador, ou acesse a versão hospedada. Instalável como PWA no celular (funciona offline). Faça backups pelo botão **Exportar** na aba Config.
