defmodule TodoAppWeb.TodoItemControllerTest do
  use TodoAppWeb.ConnCase
  alias TodoApp.Todo

  @valid_todo_item_attrs %{
    body: "Some body",
    title: "Some title"
  }

  @invalid_todo_item_attrs %{
    body: nil,
    title: nil
  }

  @updated_todo_item_attrs %{
    body: "Some body updated",
    title: "Some title updated"
  }

  @updated_invalid_todo_item_attrs %{
    body: nil,
    title: nil
  }

  def fixture(:todo_item) do
    {:ok, todo_item} = Todo.create_todo_item(@valid_todo_item_attrs)
    todo_item
  end

  describe "index" do
    test "list all to do items", %{conn: conn} do
      conn = get(conn, Routes.todo_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Todo Items."
    end
  end

  describe "new todo_item" do
    test "rends a form", %{conn: conn} do
      conn = get(conn, Routes.todo_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Todo Item."
    end
  end

  describe "create todo_item" do
    test "redirect to show once a valid todo_item is created", %{conn: conn} do
      conn = post(conn, Routes.todo_item_path(conn, :create), todo_item: @valid_todo_item_attrs)
      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.todo_item_path(conn, :show, id)

      conn = get(conn, Routes.todo_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Todo Item."
    end

    test "render error when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.todo_item_path(conn, :create), todo_item: @invalid_todo_item_attrs)
      assert html_response(conn, 200) =~ "New Todo Item."
    end
  end

  describe "edit todo_item" do
    setup([:create_todo_item])

    test "renders form for editing todo_item", %{conn: conn, todo_item: todo_item} do
      conn = get(conn, Routes.todo_item_path(conn, :edit, todo_item))
      assert html_response(conn, 200) =~ "Edit Todo Item."
    end
  end

  describe "update todo_item" do
    setup([:create_todo_item])

    test "redirects when data is valid", %{conn: conn, todo_item: todo_item} do
      conn =
        put(conn, Routes.todo_item_path(conn, :update, todo_item), %{
          todo_item: @updated_todo_item_attrs
        })

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.todo_item_path(conn, :show, id)

      conn = get(conn, Routes.todo_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Some body updated"
      assert html_response(conn, 200) =~ "Some title updated"
    end

    test "renders errors when data is invalid", %{conn: conn, todo_item: todo_item} do
      conn =
        put(conn, Routes.todo_item_path(conn, :update, todo_item), %{
          todo_item: @updated_invalid_todo_item_attrs
        })

      assert html_response(conn, 200) =~ "Edit Todo Item."
    end
  end

  defp create_todo_item(_) do
    todo_item = fixture(:todo_item)
    %{todo_item: todo_item}
  end
end
