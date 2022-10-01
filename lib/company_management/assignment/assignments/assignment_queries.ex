defmodule CompanyManagement.Assignment.AssignmentQueries do
  @moduledoc """
  Module responsible for handling assignments queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | Assignments.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  @spec assignments_summary(Ecto.Query.t() | Assignemnts.t()) :: Ecto.Query.t()
  def assignments_summary(query \\ base()) do
    query
    |> select(
      [assignments],
      {
        assignments.status,
        count(assignments.status)
      }
    )
  end

  @spec where_user_id(Ecto.Query.t() | Assignments.t(), String.t() | integer()) :: Ecto.Query.t()
  def where_user_id(query \\ base(), user_id) do
    query
    |> where(user_id: ^user_id)
  end

  @spec where_company_id(Ecto.Query.t() | Assignments.t(), String.t() | integer()) ::
          Ecto.Query.t()
  def where_company_id(query \\ base(), company_id) do
    query
    |> where(
      [user: u],
      u.company_id == ^company_id
    )
  end

  @spec join_users(Ecto.Query.t() | Assignments.t()) :: Ecto.Query.t()
  def join_users(query \\ base()) do
    query
    |> join(:inner, [assignments], _ in assoc(assignments, :user), as: :user)
  end

  @spec group_by_column(Ecto.Query.t() | Assignments.t(), atom()) :: Ecto.Query.t()
  def group_by_column(query \\ base(), column) do
    query
    |> group_by(^column)
  end

  #### PRIVATE

  @spec base() :: Assignments.t()
  defp base, do: CompanyManagement.Assignment.Assignment
end
