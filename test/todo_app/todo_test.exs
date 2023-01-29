defmodule TodoApp.TodoTest do
  use TodoApp.DataCase

  alias TodoApp.Todo
  alias TodoApp.Todo.TodoItem

  @valid_todo_item_attrs %{
    body: "Some body",
    title: "Some title"
  }

  test "list_todo_items/0 returns all todo_items" do
    {:ok, %TodoItem{} = todo_item} = Todo.create_todo_item(@valid_todo_item_attrs)

    assert Todo.list_todo_items() == [todo_item]
  end

  test "create_todo_item/1 with valid data, creates a todo_item" do
    {:ok, %TodoItem{} = _todo_item} = Todo.create_todo_item(@valid_todo_item_attrs)
  end
end
