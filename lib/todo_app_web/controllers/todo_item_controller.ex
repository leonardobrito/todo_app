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

  def show(conn, %{"id" => id}) do
    todo_item = Todo.get_todo_item!(id)
    render(conn, "show.html", todo_item: todo_item)
  end

  def edit(conn, %{"id" => _id}) do
    render(conn, "edit.html")
  end

  def update(conn, %{"id" => id, "todo_item" => todo_item_params}) do
    todo_item = Todo.get_todo_item!(id)

    case Todo.update_todo_item(todo_item, todo_item_params) do
      {:ok, updated_todo_item} ->
        redirect(conn, to: Routes.todo_item_path(conn, :show, updated_todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_item = Todo.get_todo_item!(id)
    {:ok, _deleted_todo_item} = Todo.delete_todo_item(todo_item)
    redirect(conn, to: Routes.todo_item_path(conn, :index))
  end
end
