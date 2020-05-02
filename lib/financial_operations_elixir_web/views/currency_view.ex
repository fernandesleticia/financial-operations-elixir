defmodule FinancialOperationsElixirWeb.CurrencyView do
  use FinancialOperationsElixirWeb, :view
  alias FinancialOperationsElixirWeb.CurrencyView

  def render("index.json", %{currencies: currencies}) do
    %{data: render_many(currencies, CurrencyView, "currency.json")}
  end

  def render("show.json", %{currency: currency}) do
    %{data: render_one(currency, CurrencyView, "currency.json")}
  end

  def render("currency.json", %{currency: currency}) do
    %{id: currency.id,
      name: currency.name,
      symbol: currency.symbol}
  end
end
