defmodule CompanyManagement.Assignment.AssignmentQueries do
  @moduledoc """
  Module responsible for handling assignments queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | Assignments.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  @spec where_user_id(Ecto.Query.t(), String.t() | integer()) :: Ecto.Query.t()
  def where_user_id(query \\ base(), user_id) do
    query
    |> where(user_id: ^user_id)
  end

  #### PRIVATE

  @spec base() :: Assignments.t()
  defp base, do: CompanyManagement.Assignment.Assignment
end
