defmodule FinancialOperationsElixirWeb.TransactionView do
  use FinancialOperationsElixirWeb, :view
  alias FinancialOperationsElixirWeb.TransactionView

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, TransactionView, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{id: transaction.id,
      amount: transaction.amount,
      payer_value_date: transaction.payer_value_date}
  end
end
