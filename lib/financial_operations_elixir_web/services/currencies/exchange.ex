defmodule FinancialOperationsElixirWeb.Services.Currencies.Exchange do
  def cambio(amount, currency_code) do
    currency_rate = rate(currency_code)
    amount*currency_rate
  end

  def rate(currency_code) do
    rates = all_rates
    rates[currency_code]
  end

  defp all_rates do
    response = get_exchange_rates |> Poison.decode!()
    response["rates"]
  end

  defp get_exchange_rates do
    url = "https://api.exchangeratesapi.io/latest?base=BRL"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Not found"
      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end
end
