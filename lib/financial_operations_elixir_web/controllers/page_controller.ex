defmodule FinancialOperationsElixirWeb.PageController do
  use FinancialOperationsElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
