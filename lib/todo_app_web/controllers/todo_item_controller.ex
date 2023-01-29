defmodule TodoAppWeb.TodoItemController do
  use TodoAppWeb, :controller
  alias TodoApp.Todo

  def index(conn, _params) do
    todo_items = Todo.list_todo_items()
    render(conn, "index.html", todo_items: todo_items)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
