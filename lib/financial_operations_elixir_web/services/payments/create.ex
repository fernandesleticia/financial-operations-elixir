defmodule FinancialOperationsElixirWeb.Services.Payments.Create do
  alias FinancialOperationsElixir.Payments
  alias FinancialOperationsElixir.Payments.Payment
  alias FinancialOperationsElixirWeb.Services.Transactions.Create
  alias FinancialOperationsElixirWeb.Services.Utils.GenerateCode
  
  defmodule Payment do
    defstruct tracking_code: "", value: 0.0, beneficiary_id: 0, transaction_id: 0, batch_id: 0 
  end

  defp payments(payments_drafts_json) do
    Poison.decode!(payments_drafts_json, as: [%Payment{}])
  end

  defp payments_params(payment_draft) do
    %{"tracking_code"=>payment_draft.tracking_code, "value"=>payment_draft.value, "transaction_id"=>payment_draft.transaction_id, "beneficiary_id"=>payment_draft.beneficiary_id, "batch_id"=>payment_draft.batch_id}
  end

  defp create_payment(payment_draft, batch) do 
    tracking_code = GenerateCode.generate(10)

    batch_id = batch.id
    beneficiary_id = System.unique_integer() # get beneficiary id from payment draft
    transaction_draft = %{tracking_code: tracking_code, value: payment_draft["value"]}
    transaction = create_transaction(transaction_draft)
    transaction_id = transaction.id
    
    payment_draft = %Payment{transaction_id: transaction_id, batch_id: batch_id, tracking_code: tracking_code, beneficiary_id: beneficiary_id}

    with {:ok, %FinancialOperationsElixir.Payments.Payment{} = payment} <- payments_params(payment_draft) |> Payments.create_payment() do
      IO.puts "PAYMENT CREATED"
    end 
  end 

  defp create_transaction(payment_draft) do
    Create.create_transaction(payment_draft)
  end

  def mount_payments(payments_draft, batch) do
    Enum.each(payments_draft, &create_payment(&1, batch))  
  end
end