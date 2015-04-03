defmodule Todo.TodoController do
  use Todo.Web, :controller
  alias Todo.Models.Todo, as: Td

  plug :action

  def index(conn, _params) do
    json conn, Todo.Store.list
  end

  def create(conn, params) do
    json conn, Todo.Store.add(params[:title])
  end

  def update(conn, params) do
    json conn, %Td{title: params[:title], completed: params[:completed]}
  end

  def delete(conn, params) do
    json conn,Todo.Store.remove(%Td{title: params[:title], completed: params[:completed]})
  end
end
