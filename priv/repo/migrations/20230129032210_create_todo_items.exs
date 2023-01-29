defmodule TodoApp.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table("todo_items") do
      add(:body, :text, null: false)
      add(:title, :string, null: false)

      timestamps()
    end
  end
end
