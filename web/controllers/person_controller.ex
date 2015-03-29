defmodule Example.PersonController do
  use Example.Web, :controller

  plug :action

  def show(conn, _params) do
    json conn, %{name: "Steven"}
  end
end
