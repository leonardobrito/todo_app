defmodule TodoAppWeb.TodoItemControllerTest do
  use TodoAppWeb.ConnCase

  describe "index" do
    test "list all to do items", %{conn: conn} do
      conn = get(conn, Routes.todo_item_path(conn, :index))
    end
  end
end
