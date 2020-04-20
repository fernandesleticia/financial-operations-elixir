import FinancialOperationsElixir.Factory

defmodule FinancialOperationsElixir.PayersTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Payers

  describe "payers" do
    alias FinancialOperationsElixir.Payers.Payer

    account = build(:account)

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def payer_fixture(attrs \\ %{}) do
      {:ok, payer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Payers.create_payer()

      payer
    end

    test "list_payers/0 returns all payers" do
      payer = payer_fixture()
      assert Payers.list_payers() == [payer]
    end

    test "get_payer!/1 returns the payer with given id" do
      payer = payer_fixture()
      assert Payers.get_payer!(payer.id) == payer
    end

    test "create_payer/1 with valid data creates a payer" do
      assert {:ok, %Payer{} = payer} = Payers.create_payer(@valid_attrs)
    end

    # test "create_payer/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Payers.create_payer(@invalid_attrs)
    # end

    test "update_payer/2 with valid data updates the payer" do
      payer = payer_fixture()
      assert {:ok, %Payer{} = payer} = Payers.update_payer(payer, @update_attrs)
    end

    # test "update_payer/2 with invalid data returns error changeset" do
    #   payer = payer_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Payers.update_payer(payer, @invalid_attrs)
    #   assert payer == Payers.get_payer!(payer.id)
    # end

    test "delete_payer/1 deletes the payer" do
      payer = payer_fixture()
      assert {:ok, %Payer{}} = Payers.delete_payer(payer)
      assert_raise Ecto.NoResultsError, fn -> Payers.get_payer!(payer.id) end
    end

    test "change_payer/1 returns a payer changeset" do
      payer = payer_fixture()
      assert %Ecto.Changeset{} = Payers.change_payer(payer)
    end
  end
end
