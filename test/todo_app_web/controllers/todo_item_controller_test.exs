defmodule TodoAppWeb.TodoItemControllerTest do
  use TodoAppWeb.ConnCase

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
end
