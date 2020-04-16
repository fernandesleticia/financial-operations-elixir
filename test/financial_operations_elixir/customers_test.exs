defmodule FinancialOperationsElixir.CustomersTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Customers

  describe "persons" do
    alias FinancialOperationsElixir.Customers.Person

    @valid_attrs %{first_name: "some first_name", identity_card_number: "some identity_card_number", last_name: "some last_name"}
    @update_attrs %{first_name: "some updated first_name", identity_card_number: "some updated identity_card_number", last_name: "some updated last_name"}
    @invalid_attrs %{first_name: nil, identity_card_number: nil, last_name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Customers.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Customers.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Customers.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Customers.create_person(@valid_attrs)
      assert person.first_name == "some first_name"
      assert person.identity_card_number == "some identity_card_number"
      assert person.last_name == "some last_name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Customers.update_person(person, @update_attrs)
      assert person.first_name == "some updated first_name"
      assert person.identity_card_number == "some updated identity_card_number"
      assert person.last_name == "some updated last_name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_person(person, @invalid_attrs)
      assert person == Customers.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Customers.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Customers.change_person(person)
    end
  end
end
