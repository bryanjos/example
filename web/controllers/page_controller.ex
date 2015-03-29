defmodule Example.PageController do
  use Example.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
