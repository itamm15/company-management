defmodule CompanyManagement.Repo.Migrations.AddRolesToUsersTable do
  use Ecto.Migration

  def change do
    create_role_type =
      "CREATE TYPE role_type AS ENUM ('admin', 'developer', 'hr', 'manager', 'accountant', 'user')"

    drop_role_type = "DROP TYPE role_type"
    execute(create_role_type, drop_role_type)

    alter table(:users) do
      add :role, :role_type
    end
  end
end
