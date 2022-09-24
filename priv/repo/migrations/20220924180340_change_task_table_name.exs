defmodule CompanyManagement.Repo.Migrations.ChangeTaskTableName do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE tasks RENAME TO assignments;")
  end

  def down do
    execute("ALTER TABLE assignments RENAME TO tasks;")
  end
end
