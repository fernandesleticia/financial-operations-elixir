defmodule FinancialOperationsElixirWeb.PaymentView do
  use FinancialOperationsElixirWeb, :view
  alias FinancialOperationsElixirWeb.PaymentView

  def render("index.json", %{payments: payments}) do
    %{data: render_many(payments, PaymentView, "payment.json")}
  end

  def render("show.json", %{payment: payment}) do
    %{data: render_one(payment, PaymentView, "payment.json")}
  end

  def render("payment.json", %{payment: payment}) do
    %{id: payment.id,
      value: payment.value,
      tracking_code: payment.tracking_code}
  end
end
