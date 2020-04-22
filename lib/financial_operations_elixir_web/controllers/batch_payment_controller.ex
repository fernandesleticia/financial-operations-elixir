defmodule FinancialOperationsElixirWeb.BatchPaymentController do
  use FinancialOperationsElixirWeb, :controller

  alias FinancialOperationsElixir.Batches
  alias FinancialOperationsElixir.Batches.BatchPayment

  action_fallback FinancialOperationsElixirWeb.FallbackController

  def index(conn, _params) do
    batch_payments = Batches.list_batch_payments()
    render(conn, "index.json", batch_payments: batch_payments)
  end

  def create(conn, %{"batch_payment" => batch_payment_params}) do
    with {:ok, %BatchPayment{} = batch_payment} <- Batches.create_batch_payment(batch_payment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.batch_payment_path(conn, :show, batch_payment))
      |> render("show.json", batch_payment: batch_payment)
    end
  end

  def show(conn, %{"id" => id}) do
    batch_payment = Batches.get_batch_payment!(id)
    render(conn, "show.json", batch_payment: batch_payment)
  end

  def update(conn, %{"id" => id, "batch_payment" => batch_payment_params}) do
    batch_payment = Batches.get_batch_payment!(id)

    with {:ok, %BatchPayment{} = batch_payment} <- Batches.update_batch_payment(batch_payment, batch_payment_params) do
      render(conn, "show.json", batch_payment: batch_payment)
    end
  end

  def delete(conn, %{"id" => id}) do
    batch_payment = Batches.get_batch_payment!(id)

    with {:ok, %BatchPayment{}} <- Batches.delete_batch_payment(batch_payment) do
      send_resp(conn, :no_content, "")
    end
  end
end
