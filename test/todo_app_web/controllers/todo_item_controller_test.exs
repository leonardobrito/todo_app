defmodule TodoAppWeb.TodoItemControllerTest do
  use TodoAppWeb.ConnCase

  @valid_todo_item_attrs %{
    body: "Some body",
    title: "Some title"
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

      conn = get(conn, Routes.todo_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Todo Item."
    end
  end
end
