# [Desafio 02 - Relatório de reservas de voos](https://www.notion.so/Desafio-02-Relat-rio-de-reservas-de-voos-cd44db56fc0a432896c23475a21b8f29)

## 💻 Sobre o desafio

Nesse desafio, você deverá incrementar a sua solução do [desafio anterior](https://www.notion.so/Desafio-01-Reservas-de-voos-f5fd8814ce904360b2500449143e589e). Agora deverá ser possível também gerar relatórios das reservas de voos de acordo com o intervalo de tempo especificado na chamada da função.

Dito isso, é esperado que a função receba dois parâmetros: data inicial e data final. Todas as reservas que estiverem agendadas para esse intervalo de tempo, deve entrar no arquivo CSV do relatório.

Exemplo de chamada da função e saída esperada: 

```elixir
iex> Flightex.generate_report(from_date, to_date)
...> {:ok, "Report generated successfully"}
```

Em caso de dúvidas na hora de lidar com datas, você pode consultar esses materiais:

[NaiveDateTime](https://hexdocs.pm/elixir/NaiveDateTime.html#content)

[Date](https://hexdocs.pm/elixir/Date.html)

O CSV deverá estar no seguinte formato:

```
user_id1,Vitória,Salvador,2021-03-22 19:29:25.607218
user_id2,São Paulo,Rio de Janeiro,2021-03-14 12:12:25.607218
user_id1,São Paulo,Londres,2021-04-18 08:45:25.607218
```

ID do usuário, cidade de origem, cidade de destino e data.
