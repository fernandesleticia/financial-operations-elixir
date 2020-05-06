defmodule FinancialOperationsElixirWeb.Services.Transactions.Create do
  alias FinancialOperationsElixirWeb.Services.Currencies.Exchange
  alias FinancialOperationsElixir.Transactions
  alias FinancialOperationsElixir.Transactions.Transaction
  
  defp transactions_params(payment) do
    final_amount = Exchange.cambio(payment.value, "USD") # get currebcy code from batch
    currency_id = 1 #get currency id from batch
    payer_id = 1 #get payer id from batch
    account_id = 1 # get account id trougth beneficiary
    payer_value_date = ~D[2010-04-17] # get date from batch(add to batch)
    %{"tracking_code"=>payment.tracking_code, "amount"=>payment.value, "final_amount"=>final_amount, "payer_value_date"=>payer_value_date, "currency_id"=>currency_id, "account_id"=>account_id, "payer_id"=>payer_id}
  end

  def create_transaction(payment) do
    with {:ok, %FinancialOperationsElixir.Transactions.Transaction{} = transaction} <- transactions_params(payment) |> Transactions.create_transaction() do
      IO.inspect transaction
    end 
  end
end