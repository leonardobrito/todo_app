defmodule TodoApp.Todo.TodoItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_items" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  def changeset(todo_item, attrs) do
    todo_item
    |> cast(attrs, [:body, :title])
    |> validate_required([:body, :title])
  end
end
