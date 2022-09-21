defmodule CompanyManagement.Task.Task do
  @moduledoc """
  Task schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  # type
  @type t :: %__MODULE__{}

  # attributes
  @required_fields ~w(description status admin_id user_id)a
  @statuses ~w(pending ongoing review finished)a

  schema "tasks" do
    field :description, :string
    field :status, Ecto.Enum, values: [:pending, :ongoing, :review, :finished]

    timestamps()
    belongs_to :admin, CompanyManagement.Company.User, foreign_key: :admin_id
    belongs_to :user, CompanyManagement.Company.User, foreign_key: :user_id
  end

  def changeset(task, attrs) do
    task
    |> cast(attrs, @required_fields)
    |> validate_inclusion(:status, @statuses)
  end
end
