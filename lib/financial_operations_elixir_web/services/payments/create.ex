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

  defp create_payment(payment_draft) do
    tracking_code = GenerateCode.generate(10)
    batch_id = System.unique_integer()
    transaction_id = System.unique_integer()
    beneficiary_id = System.unique_integer()
    payment_draft = %{payment_draft | transaction_id: transaction_id, batch_id: batch_id, tracking_code: tracking_code, beneficiary_id: beneficiary_id}
    
    with {:ok, %FinancialOperationsElixir.Payments.Payment{} = payment} <- payments_params(payment_draft) |> Payments.create_payment() do
      Create.create_transaction(payment)
    end 
  end 

  def mount_payments(payments_drafts_json) do
    Enum.each(payments(payments_drafts_json), &create_payment/1)  
  end
end