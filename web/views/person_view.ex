defmodule Example.PersonView do
  use Example.Web, :view

  def render("show.json", data) do
    data
  end
end
