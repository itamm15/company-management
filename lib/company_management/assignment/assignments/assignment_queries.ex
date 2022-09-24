defmodule CompanyManagement.Assignment.AssignmentQueries do
  @moduledoc """
  Module responsible for handling assignments queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | Assignments.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  #### PRIVATE

  @spec base() :: Assignments.t()
  defp base, do: CompanyManagement.Assignment.Assignment
end
