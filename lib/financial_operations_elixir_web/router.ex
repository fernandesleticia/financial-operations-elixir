defmodule FinancialOperationsElixirWeb.Router do
  use FinancialOperationsElixirWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FinancialOperationsElixirWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
  
  scope "/api", FinancialOperationsElixirWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/transactions", TransactionController, except: [:new, :edit]
    resources "/batch_payments", BatchPaymentController, except: [:new, :edit]
    resources "/payments", PaymentController, except: [:new, :edit]
  end
end
