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

  def create(conn, %{"todo_item" => todo_item_params}) do
    case Todo.create_todo_item(todo_item_params) do
      {:ok, todo_item} ->
        redirect(conn, to: Routes.todo_item_path(conn, :show, todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => _id}) do
    render(conn, "show.html")
  end
end
