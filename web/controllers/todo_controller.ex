defmodule Todo.TodoController do
  use Todo.Web, :controller 

  plug :action

  def index(conn, _params) do
    json conn, Todo.Store.list
  end

  def create(conn, params) do
    Todo.Store.add(params["title"])
    json conn, %{data: :ok}
  end

  def update(conn, params) do
    Todo.Store.update(String.to_integer(params["id"]), String.to_atom(params["completed"]))
    json conn, %{data: :ok}
  end

  def delete(conn, params) do
    Todo.Store.remove(String.to_integer(params["id"]))
    json conn, %{data: :ok}
  end
end
