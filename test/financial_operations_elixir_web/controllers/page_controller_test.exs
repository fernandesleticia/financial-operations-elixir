defmodule FinancialOperationsElixirWeb.PageControllerTest do
  use FinancialOperationsElixirWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Financial Operations Elixir!"
  end
end
