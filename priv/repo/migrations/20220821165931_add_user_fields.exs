defmodule CompanyManagement.Repo.Migrations.AddUserFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :phone_number, :string, null: false
      add :bank_account, :string, null: false
      add :birth_date, :date, null: false
      add :address, :string, null: true
    end
  end
end
