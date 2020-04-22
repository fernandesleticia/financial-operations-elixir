defmodule FinancialOperationsElixirWeb.BatchPaymentControllerTest do
  use FinancialOperationsElixirWeb.ConnCase

  alias FinancialOperationsElixir.Batches
  alias FinancialOperationsElixir.Batches.BatchPayment

  @create_attrs %{
    status: "some status",
    total_value: 120.5
  }
  @update_attrs %{
    status: "some updated status",
    total_value: 456.7
  }
  @invalid_attrs %{status: nil, total_value: nil}

  def fixture(:batch_payment) do
    {:ok, batch_payment} = Batches.create_batch_payment(@create_attrs)
    batch_payment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all batch_payments", %{conn: conn} do
      conn = get(conn, Routes.batch_payment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create batch_payment" do
    test "renders batch_payment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.batch_payment_path(conn, :create), batch_payment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.batch_payment_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => "some status",
               "total_value" => 120.5
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post(conn, Routes.batch_payment_path(conn, :create), batch_payment: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "update batch_payment" do
    setup [:create_batch_payment]

    test "renders batch_payment when data is valid", %{conn: conn, batch_payment: %BatchPayment{id: id} = batch_payment} do
      conn = put(conn, Routes.batch_payment_path(conn, :update, batch_payment), batch_payment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.batch_payment_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => "some updated status",
               "total_value" => 456.7
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn, batch_payment: batch_payment} do
    #   conn = put(conn, Routes.batch_payment_path(conn, :update, batch_payment), batch_payment: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  describe "delete batch_payment" do
    setup [:create_batch_payment]

    test "deletes chosen batch_payment", %{conn: conn, batch_payment: batch_payment} do
      conn = delete(conn, Routes.batch_payment_path(conn, :delete, batch_payment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.batch_payment_path(conn, :show, batch_payment))
      end
    end
  end

  defp create_batch_payment(_) do
    batch_payment = fixture(:batch_payment)
    {:ok, batch_payment: batch_payment}
  end
end
