defmodule FinancialOperationsElixirWeb.TransactionControllerTest do
  use FinancialOperationsElixirWeb.ConnCase

  alias FinancialOperationsElixir.Transactions
  alias FinancialOperationsElixir.Transactions.Transaction

  @create_attrs %{
    amount: 120.5,
    payer_value_date: ~D[2010-04-17]
  }
  @update_attrs %{
    amount: 456.7,
    payer_value_date: ~D[2011-05-18]
  }
  @invalid_attrs %{amount: nil, payer_value_date: nil}

  def fixture(:transaction) do
    {:ok, transaction} = Transactions.create_transaction(@create_attrs)
    transaction
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transactions", %{conn: conn} do
      conn = get(conn, Routes.transaction_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transaction" do
    test "renders transaction when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transaction_path(conn, :create), transaction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 120.5,
               "payer_value_date" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post(conn, Routes.transaction_path(conn, :create), transaction: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "update transaction" do
    setup [:create_transaction]

    test "renders transaction when data is valid", %{conn: conn, transaction: %Transaction{id: id} = transaction} do
      conn = put(conn, Routes.transaction_path(conn, :update, transaction), transaction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 456.7,
               "payer_value_date" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn, transaction: transaction} do
    #   conn = put(conn, Routes.transaction_path(conn, :update, transaction), transaction: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "delete transaction" do
    setup [:create_transaction]

    test "deletes chosen transaction", %{conn: conn, transaction: transaction} do
      conn = delete(conn, Routes.transaction_path(conn, :delete, transaction))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transaction_path(conn, :show, transaction))
      end
    end
  end

  defp create_transaction(_) do
    transaction = fixture(:transaction)
    {:ok, transaction: transaction}
  end
end
