defmodule FinancialOperationsElixirWeb.Services.Utils.GenerateCode do
  def generate(length) do
    length
    |> :crypto.strong_rand_bytes
    |> Base.encode64
    |> binary_part(0, length)
  end
end
