defmodule TodoApp.TodoTest do
  use TodoApp.DataCase

  alias TodoApp.Todo
  alias TodoApp.Todo.TodoItem

  test "create_todo_item/1" do
    {:ok, %TodoItem{} = todo_item} =
      Todo.create_todo_item(%{body: "Some body", title: "Some title"})
  end
end
