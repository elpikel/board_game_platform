defmodule BoardGameWeb.PageControllerTest do
  use BoardGameWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Shop ECrawler"
  end
end
