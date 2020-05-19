defmodule FinancialOperationsElixirWeb.Services.Currencies.Codes do

  alias FinancialOperationsElixir.Currencies
  alias FinancialOperationsElixir.Currencies.Currency

  def populate do
   
  end

  def all_codes do
    Currencies.list_currencies
  end
end
