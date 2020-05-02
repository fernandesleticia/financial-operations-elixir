defmodule FinancialOperationsElixirWeb.CurrencyControllerTest do
  use FinancialOperationsElixirWeb.ConnCase

  alias FinancialOperationsElixir.Currencies
  alias FinancialOperationsElixir.Currencies.Currency

  @create_attrs %{
    name: "some name",
    symbol: "some symbol"
  }
  @update_attrs %{
    name: "some updated name",
    symbol: "some updated symbol"
  }
  @invalid_attrs %{name: nil, symbol: nil}

  def fixture(:currency) do
    {:ok, currency} = Currencies.create_currency(@create_attrs)
    currency
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get(conn, Routes.currency_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create currency" do
    test "renders currency when data is valid", %{conn: conn} do
      conn = post(conn, Routes.currency_path(conn, :create), currency: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.currency_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "symbol" => "some symbol"
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post(conn, Routes.currency_path(conn, :create), currency: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "update currency" do
    setup [:create_currency]

    test "renders currency when data is valid", %{conn: conn, currency: %Currency{id: id} = currency} do
      conn = put(conn, Routes.currency_path(conn, :update, currency), currency: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.currency_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "symbol" => "some updated symbol"
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn, currency: currency} do
    #   conn = put(conn, Routes.currency_path(conn, :update, currency), currency: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "delete currency" do
    setup [:create_currency]

    test "deletes chosen currency", %{conn: conn, currency: currency} do
      conn = delete(conn, Routes.currency_path(conn, :delete, currency))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.currency_path(conn, :show, currency))
      end
    end
  end

  defp create_currency(_) do
    currency = fixture(:currency)
    {:ok, currency: currency}
  end
end
