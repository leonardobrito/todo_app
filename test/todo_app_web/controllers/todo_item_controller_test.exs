defmodule TodoAppWeb.TodoItemControllerTest do
  use TodoAppWeb.ConnCase

  @valid_todo_item_attrs %{
    body: "Some body",
    title: "Some title"
  }

  @invalid_todo_item_attrs %{
    body: nil,
    title: nil
  }

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
end
