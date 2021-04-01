defmodule CrudMeals.AccountsTest do
  use CrudMeals.DataCase

  alias CrudMeals.Accounts

  describe "users" do
    alias CrudMeals.Accounts.User

    @valid_attrs %{cpf: "12345678900", email: "nome@banana.com", name: "Fulano de Tal", meals: []}
    @update_attrs %{
      cpf: "12345678911",
      email: "novoemail@banana.com",
      name: "Fulano Alterado de Tal"
    }
    @invalid_attrs %{cpf: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()

      [head | _tail] = Accounts.list_users()
      IO.inspect head
      IO.inspect user
      assert head.id == user.id
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.cpf == "12345678900"
      assert user.email == "nome@banana.com"
      assert user.name == "Fulano de Tal"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.cpf == "12345678911"
      assert user.email == "novoemail@banana.com"
      assert user.name == "Fulano Alterado de Tal"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
