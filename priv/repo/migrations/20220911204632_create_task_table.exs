defmodule CompanyManagement.Repo.Migrations.CreateTaskTable do
  use Ecto.Migration

  def change do
    create_status_type =
      "CREATE TYPE status_type AS ENUM ('pending', 'ongoing', 'review', 'finished')"

    drop_status_type = "DROP TYPE status_type"

    execute(create_status_type, drop_status_type)

    create table(:tasks) do
      add :description, :string, null: false
      add :status, :status_type
      add :admin_id, references(:users)
      add :user_id, references(:users)

      timestamps()
    end
  end
end
