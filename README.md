# CrudMeals

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


  

# Sobre o desafio 01 - Capítulo III

Nesse desafio, você deverá criar uma aplicação para monitoramento de consumo de alimentos durante o dia.

O schema de uma refeição deverá possuir os seguintes campos:

```elixir
# Meal
{
	id: id,
	descricao: descricao,
	data: data,
	calorias: calorias
}
```

**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

- Para criar um campo com uma data no Ecto, em seu schema, você deverá utilizar o tipo `:datetime`;
- O campo `descricao` irá possuir informações sobre o que foi consumido no momento (tipo de dado: string);
- O campo `data` deverá armazenar a data e hora em que o alimento foi consumido;
- O campo `calorias` irá possuir informações sobre a quantidade de calorias do alimento consumido;
- Os dados deverão ser salvos em uma tabela chamada `meals`.

A aplicação deverá possuir rotas para satisfazer os requisitos de um CRUD normal:

1. Deve ser possível cadastrar uma refeição feita, retornando um status `201` e a informação criada;
2. Deve ser possível atualizar uma refeição já cadastrada, retornando um status `200` e a refeição atualizada;
3. Deve ser possível exibir uma refeição existente, retornando um status `200` e a refeição buscada;
4. Deve ser possível excluir uma refeição cadastrada, retornando um status `200` ou `204`.

# Sobre o desafio 02 - Capítulo III

Nesse desafio, você deverá criar testes para a aplicação que foi desenvolvida ao longo desse módulo. 

Caso você já tenha desenvolvido os testes como forma de complementar a aplicação, basta submeter o link do mesmo repositório para esse desafio.

É importante que os testes tenham uma cobertura de 100%

[Link para o arquivo coveralls.html](https://rawgit.com/svgreve/crud_meals/main/cover/excoveralls.html)

# Sobre o desafio 01 - Capítulo IV

Nesse desafio, você deverá implementar uma nova feature na aplicação feita no desafio 01 do capítulo anterior.

Agora a aplicação deve possuir uma tabela `users` e esses usuários devem possuir uma relação *one-to-many* com a tabela `meals` (já feita no primeiro desafio do capítulo) onde cada usuário tem a sua própria lista de refeições diárias.

O schema de um usuário deverá possuir os seguintes campos:

```elixir
# User
{
	id: id,
	nome: nome,
	cpf: cpf,
	email: email
}
```

**Obs:** O Id deve ser gerado automaticamente, pode ser um inteiro ou um UUID, mas não pode se repetir.

Você pode resetar o banco de dados usando o comando `mix ecto.reset`. Assim, os dados registrados durante o desenvolvimento da aplicação para o desafio 01 **CRUD - Refeições diárias** serão apagados e você não terá problemas ao adicionar o relacionamento com a nova tabela.