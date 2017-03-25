defmodule BoardGameWeb.PageControllerTest do
  use BoardGameWeb.ConnCase

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BoardGame.Repo)
  end
  
  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Shop ECrawler"
  end
end
