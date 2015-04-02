defmodule Todo.TodoController do
  use Todo.Web, :controller
  alias Todo.Models.Todo, as: Td

  plug :action

  def index(conn, _params) do
    json conn, []
  end

  def show(conn, params) do
    json conn, %Td{title: "test", completed: false}
  end

  def create(conn, params) do
    json conn, %Td{title: params[:title], completed: params[:completed]}
  end

  def update(conn, params) do
    json conn, %Td{title: params[:title], completed: params[:completed]}
  end

  def delete(conn, _params) do
    json conn, %{}
  end
end
