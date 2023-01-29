defmodule TodoApp.TodoTest do
  use TodoApp.DataCase

  alias TodoApp.Todo
  alias TodoApp.Todo.TodoItem

  @valid_todo_item_attrs %{
    body: "Some body",
    title: "Some title"
  }

  @updated_todo_item_attrs %{
    body: "Some body updated",
    title: "Some title updated"
  }

  def todo_item_fixtures(attrs \\ %{}) do
    {:ok, todo_item} =
      attrs
      |> Enum.into(@valid_todo_item_attrs)
      |> Todo.create_todo_item()

    todo_item
  end

  test "list_todo_items/0 returns all todo_items" do
    todo_item = todo_item_fixtures()

    assert Todo.list_todo_items() == [todo_item]
  end

  test "get_todo_item/1 return the todo_item" do
    todo_item = todo_item_fixtures()
    assert Todo.get_todo_item!(todo_item.id) == todo_item
  end

  test "create_todo_item/1 with valid data, creates a todo_item" do
    todo_item = todo_item_fixtures()
    assert todo_item.body == "Some body"
    assert todo_item.title == "Some title"
  end

  test "update_todo_item/2 with valid data, updates the todo_item" do
    todo_item = todo_item_fixtures()

    {:ok, %TodoItem{} = updated_todo_item} =
      Todo.update_todo_item(todo_item, @updated_todo_item_attrs)

    assert updated_todo_item.body == "Some body updated"
    assert updated_todo_item.title == "Some title updated"
  end

  test "delete_todo_item/1 deletes a todo_item" do
    todo_item = todo_item_fixtures()
    {:ok, _delete_todo_item} = Todo.delete_todo_item(todo_item)

    assert_raise Ecto.NoResultsError, fn ->
      Todo.get_todo_item!(todo_item.id)
    end
  end
end
