defmodule FinancialOperationsElixirWeb.Services.Validators.Iso4217.Validator do

   alias FinancialOperationsElixirWeb.Services.Validators.Iso4217.ValidCodes

   def validate(code) do
      Enum.member?(ValidCodes.codes, code)
   end
end