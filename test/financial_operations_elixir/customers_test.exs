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

  describe "companies" do
    alias FinancialOperationsElixir.Customers.Company

    @valid_attrs %{fantasy_name: "some fantasy_name", name: "some name", registration_number: "some registration_number"}
    @update_attrs %{fantasy_name: "some updated fantasy_name", name: "some updated name", registration_number: "some updated registration_number"}
    @invalid_attrs %{fantasy_name: nil, name: nil, registration_number: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Customers.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Customers.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Customers.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Customers.create_company(@valid_attrs)
      assert company.fantasy_name == "some fantasy_name"
      assert company.name == "some name"
      assert company.registration_number == "some registration_number"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Customers.update_company(company, @update_attrs)
      assert company.fantasy_name == "some updated fantasy_name"
      assert company.name == "some updated name"
      assert company.registration_number == "some updated registration_number"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_company(company, @invalid_attrs)
      assert company == Customers.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Customers.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Customers.change_company(company)
    end
  end
end
