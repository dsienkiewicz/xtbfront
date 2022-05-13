defmodule XtbfrontWeb.PageController do
  use XtbfrontWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
