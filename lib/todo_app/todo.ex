defmodule TodoApp.Todo do
  alias TodoApp.{Repo, Todo}
  alias Todo.TodoItem

  def list_todo_items() do
    Repo.all(TodoItem)
  end

  def create_todo_item(attrs) do
    alias TodoApp.Todo.TodoItem

    %TodoItem{}
    |> TodoItem.changeset(attrs)
    |> Repo.insert()
  end
end
