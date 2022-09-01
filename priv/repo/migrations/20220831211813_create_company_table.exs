defmodule CompanyManagement.Repo.Migrations.CreateCompanyTable do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string, null: false
      add :created_on, :date, null: false
      timestamps()
    end

    unique_index(:companies, :name)
  end
end
