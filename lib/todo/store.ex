defmodule Todo.Store do

  def start_link() do
    Agent.start_link(fn -> HashSet.new end, name: __MODULE__)
  end

  def list() do
    Agent.get(__MODULE__, fn(state) -> state end)
  end

  def add(title) do
    todo = %Todo.Models.Todo{title: title, completed: false}
    Agent.update(__MODULE__, &Set.put(&1, todo))
  end

  def remove(todo) do
    Agent.update(__MODULE__, &Set.delete(&1, todo))
  end
  
end