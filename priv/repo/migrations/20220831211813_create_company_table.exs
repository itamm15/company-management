defmodule CompanyManagement.Repo.Migrations.CreateCompanyTable do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string, null: false
      add :created_on, :date, null: false
      add :owner_id, references("users", on_delete: :delete_all)
      add :employee_id, references("users", on_delete: :nothing)
      timestamps()
    end
  end
end
