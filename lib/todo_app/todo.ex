defmodule TodoApp.Todo do
  alias TodoApp.Repo
  alias TodoApp.Todo.TodoItem

  def list_todo_items() do
    []
  end

  def create_todo_item(attrs) do
    alias TodoApp.Todo.TodoItem

    %TodoItem{}
    |> TodoItem.changeset(attrs)
    |> Repo.insert()
  end
end
