defmodule CompanyManagement.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  import Ecto.Changeset

  # attributes
  @required_fields ~w(first_name last_name phone_number bank_account birth_date)a
  @optional_fields ~w(address)a

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :bank_account, :string
    field :birth_date, :date
    field :address, :string
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
  end
end
