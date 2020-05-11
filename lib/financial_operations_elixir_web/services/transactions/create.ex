defmodule FinancialOperationsElixirWeb.Services.Transactions.Create do
  alias FinancialOperationsElixirWeb.Services.Currencies.Exchange
  alias FinancialOperationsElixir.Transactions
  alias FinancialOperationsElixir.Transactions.Transaction
  
  defp transactions_params(transaction_draft) do
    final_amount = Exchange.cambio(transaction_draft.value, "USD") # get currebcy code from batch
    currency_id = 1 #get currency id from batch
    payer_id = 1 #get payer id from batch
    account_id = 1 # get account id trougth beneficiary
    payer_value_date = ~D[2010-04-17] # get date from batch(add to batch)
    %{"tracking_code"=>transaction_draft.tracking_code, "amount"=>transaction_draft.value, "final_amount"=>final_amount, "payer_value_date"=>payer_value_date, "currency_id"=>currency_id, "account_id"=>account_id, "payer_id"=>payer_id}
  end

  def create_transaction(transaction_draft) do
    with {:ok, %FinancialOperationsElixir.Transactions.Transaction{} = transaction} <- transactions_params(transaction_draft) |> Transactions.create_transaction() do
      transaction
    end 
  end
end