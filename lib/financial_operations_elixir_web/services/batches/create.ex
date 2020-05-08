defmodule FinancialOperationsElixirWeb.Services.Batches.CreateService do
  alias FinancialOperationsElixir.Batches
  alias FinancialOperationsElixir.Batches.BatchPayment

  alias FinancialOperationsElixirWeb.Services.Payments.Create

  defp batch_params(batch_draft) do
    status = "open" # create method to decide status
    %{"status"=>status, "total_value"=>batch_draft["total_value"], "currency_id"=>batch_draft["currency_id"], "payer_id"=>batch_draft["payer_id"]}
  end

  #def create_batch_payment(conn, %{"total_value"=>total_value, "currency_id"=>currency_id, "payer_id"=>payer_id, "payments"=>payments}) do
  def batch_payment(batch_draft) do
    batch = batch_params(batch_draft) |> Batches.create_batch_payment()
    Create.mount_payments(batch_draft["payments"])
    batch 
  end
end