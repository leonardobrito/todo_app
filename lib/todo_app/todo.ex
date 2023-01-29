defmodule TodoApp.Todo do
  alias TodoApp.{Repo, Todo}
  alias Todo.TodoItem

  def list_todo_items() do
    Repo.all(TodoItem)
  end

  def get_todo_item!(id) do
    Repo.get!(TodoItem, id)
  end

  def create_todo_item(attrs) do
    alias TodoApp.Todo.TodoItem

    %TodoItem{}
    |> TodoItem.changeset(attrs)
    |> Repo.insert()
  end

  def update_todo_item(%TodoItem{} = todo_item, attrs) do
    todo_item
    |> TodoItem.changeset(attrs)
    |> Repo.update()
  end

  def delete_todo_item(%TodoItem{} = todo_item) do
    Repo.delete(todo_item)
  end
end
