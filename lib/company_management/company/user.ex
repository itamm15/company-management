defmodule CompanyManagement.Company.User do
  @moduledoc """
  User schema
  """
  use Ecto.Schema
  use Pow.Ecto.Schema

  import Ecto.Changeset

  # aliases
  alias CompanyManagement.Company.UsersValidation

  # attributes
  @required_fields ~w(first_name last_name phone_number bank_account birth_date role)a
  @optional_fields ~w(address)a

  schema "users" do
    belongs_to :company, CompanyManagement.Company.Company
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :bank_account, :string
    field :birth_date, :date
    field :address, :string
    field :role, Ecto.Enum, values: [:admin, :developer, :hr, :manager, :accountant, :user]
    pow_user_fields()

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> user_changeset(attrs)
  end

  defp user_changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> UsersValidation.user_validation()
  end
end
