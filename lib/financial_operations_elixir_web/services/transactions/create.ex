defmodule FinancialOperationsElixirWeb.Services.Transactions.Create do
  alias FinancialOperationsElixirWeb.Services.Currencies.Exchange
  alias FinancialOperationsElixir.Transactions
  alias FinancialOperationsElixir.Currencies
  alias FinancialOperationsElixir.Transactions.Transaction
  
  defp transactions_params(transaction_draft) do
    currency = transaction_draft.currency_id |> Currencies.get_currency!()
    final_amount = Exchange.cambio(transaction_draft.value, currency.name)
    %{"tracking_code"=>transaction_draft.tracking_code, "amount"=>transaction_draft.value, "final_amount"=>final_amount, "currency_id"=>transaction_draft.currency_id, "account_id"=>transaction_draft.account_id, "payer_id"=>transaction_draft.payer_id}
  end

  def create_transaction(transaction_draft) do
    with {:ok, %FinancialOperationsElixir.Transactions.Transaction{} = transaction} <- transactions_params(transaction_draft) |> Transactions.create_transaction() do
      transaction
    end 
  end
end