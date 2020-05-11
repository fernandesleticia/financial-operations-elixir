defmodule FinancialOperationsElixirWeb.Services.Batches.CreateService do
  alias FinancialOperationsElixir.Batches
  alias FinancialOperationsElixir.Batches.BatchPayment

  alias FinancialOperationsElixirWeb.Services.Payments.Create

  defp batch_params(batch_draft) do
    status = "open" # create method to decide status
    %{"status"=>status, "total_value"=>batch_draft["total_value"], "currency_id"=>batch_draft["currency_id"], "payer_id"=>batch_draft["payer_id"]}
  end

  def batch_payment(batch_draft) do
    batch_draft = Poison.decode!(batch_draft)
    {:ok, %BatchPayment{} = batch} = batch_params(batch_draft) |> Batches.create_batch_payment()
    create_payments(batch_draft["payments"], batch)
    {:ok, batch}
  end

  defp create_payments(payments, batch) do
    if has_payments(payments) do
      Create.mount_payments(payments, batch)
    end
  end

  defp has_payments(payments) do
    unless payments == nil do true end
  end
end