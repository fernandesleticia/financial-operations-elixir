defmodule FinancialOperationsElixir.Factory do
  alias FinancialOperationsElixir.Repo

  # Factories

  def build(:user) do
    %FinancialOperationsElixir.Auth.User{
      is_active: true, 
      email: "some email", 
      password: "some password"
    }
  end

  def build(:person) do
    %FinancialOperationsElixir.Customers.Person{
      first_name: "some first_name", 
      identity_card_number: "some identity_card_number", 
      last_name: "some last_name",
      user_id: {System.unique_integer()}
    }
  end

  def build(:company) do
    %FinancialOperationsElixir.Customers.Company{
      fantasy_name: "some fantasy_name", 
      name: "some name", 
      registration_number: "some registration_number",
      user_id: {System.unique_integer()}
    }
  end

  def build(:account) do
    %FinancialOperationsElixir.Accounts.Account{
      id: Faker.UUID.v4(),
      account_digit: "some account_digit", 
      account_number: "some account_number", 
      account_type: "some account_type", 
      bank_code: "some bank_code", 
      branch_digit: "some branch_digit", 
      branch_number: "some branch_number",
      person_id: {System.unique_integer()},
      company_id: {System.unique_integer()}
    }
  end
end