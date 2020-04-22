defmodule FinancialOperationsElixirWeb.BatchPaymentView do
  use FinancialOperationsElixirWeb, :view
  alias FinancialOperationsElixirWeb.BatchPaymentView

  def render("index.json", %{batch_payments: batch_payments}) do
    %{data: render_many(batch_payments, BatchPaymentView, "batch_payment.json")}
  end

  def render("show.json", %{batch_payment: batch_payment}) do
    %{data: render_one(batch_payment, BatchPaymentView, "batch_payment.json")}
  end

  def render("batch_payment.json", %{batch_payment: batch_payment}) do
    %{id: batch_payment.id,
      total_value: batch_payment.total_value,
      status: batch_payment.status}
  end
end
