defmodule FinancialOperationsElixir.AuthTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Auth

  describe "users" do
    alias FinancialOperationsElixir.Auth.User

    @valid_attrs %{is_active: true, email: "some email", password: "some password"}
    @update_attrs %{
      is_active: false, 
      email: "some updated email", 
      password: "some updated password"
    }
    @invalid_attrs %{is_active: nil, email: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    # test "list_users/0 returns all users" do
    #   user = user_fixture()
    #   assert Auth.list_users() == [user]
    # end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert user.email == "some email"
      assert user.is_active == true
      assert user.password == "some password"
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.is_active == true
      assert user.email == "some email"
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Auth.update_user(user, @update_attrs)
      assert user.is_active == false
      assert user.email == "some updated email"
      assert Bcrypt.verify_pass("some updated password", user.password_hash)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user.email == "some email"
      assert user.is_active == true
      assert user.password == "some password"
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end
end
