defmodule Todo.TodoView do
  use Todo.Web, :view

  def render("index.json", data) do
    data
  end

  def render("create.json", data) do
    data
  end

  def render("update.json", data) do
    data
  end


  def render("delete.json", data) do
    data
  end

end
