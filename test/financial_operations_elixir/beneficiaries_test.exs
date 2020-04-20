defmodule FinancialOperationsElixir.BeneficiariesTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Beneficiaries

  describe "beneficiaries" do
    alias FinancialOperationsElixir.Beneficiaries.Beneficiary

    @account_valid_attrs %{
      id: Faker.UUID.v4(),
      account_digit: "some account_digit", 
      account_number: "some account_number", 
      account_type: "some account_type", 
      bank_code: "some bank_code", 
      branch_digit: "some branch_digit", 
      branch_number: "some branch_number",
      person_id: {System.unique_integer()},
      company_id: {System.unique_integer()}
    }

    @update_attrs %{}
    @invalid_attrs %{account_id: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@account_valid_attrs)
        |> FinancialOperationsElixir.Accounts.create_account()

      account
    end

    def beneficiary_fixture(attrs \\ %{}) do
      account = account_fixture()
      {:ok, beneficiary} =
        attrs
        |> Enum.into(%{account_id: account.id})
        |> Beneficiaries.create_beneficiary()

      beneficiary
    end

    test "list_beneficiaries/0 returns all beneficiaries" do
      beneficiary = beneficiary_fixture()
      assert Beneficiaries.list_beneficiaries() == [beneficiary]
    end

    test "get_beneficiary!/1 returns the beneficiary with given id" do
      beneficiary = beneficiary_fixture()
      assert Beneficiaries.get_beneficiary!(beneficiary.id) == beneficiary
    end

    test "create_beneficiary/1 with valid data creates a beneficiary" do
      account = account_fixture()
      assert {:ok, %Beneficiary{} = beneficiary} = Beneficiaries.create_beneficiary(%{account_id: account.id})
    end

    test "create_beneficiary/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Beneficiaries.create_beneficiary(@invalid_attrs)
    end

    test "update_beneficiary/2 with valid data updates the beneficiary" do
      beneficiary = beneficiary_fixture()
      assert {:ok, %Beneficiary{} = beneficiary} = Beneficiaries.update_beneficiary(beneficiary, @update_attrs)
    end

    test "update_beneficiary/2 with invalid data returns error changeset" do
      beneficiary = beneficiary_fixture()
      assert {:error, %Ecto.Changeset{}} = Beneficiaries.update_beneficiary(beneficiary, @invalid_attrs)
      assert beneficiary == Beneficiaries.get_beneficiary!(beneficiary.id)
    end

    test "delete_beneficiary/1 deletes the beneficiary" do
      beneficiary = beneficiary_fixture()
      assert {:ok, %Beneficiary{}} = Beneficiaries.delete_beneficiary(beneficiary)
      assert_raise Ecto.NoResultsError, fn -> Beneficiaries.get_beneficiary!(beneficiary.id) end
    end

    test "change_beneficiary/1 returns a beneficiary changeset" do
      beneficiary = beneficiary_fixture()
      assert %Ecto.Changeset{} = Beneficiaries.change_beneficiary(beneficiary)
    end
  end
end
