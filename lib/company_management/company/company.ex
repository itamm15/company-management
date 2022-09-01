defmodule CompanyManagement.Company.Company do
  @moduledoc """
  Company schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  # attributes
  @required_fields ~w(name created_on owner employee)a

  schema "companies" do
    has_many(:users, CompanyManagement.Company.User)
    field :name, :string
    field :created_on, :date
    timestamps()
  end

  def changeset(company, attrs) do
    company
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
