defmodule CompanyManagement.Task.TaskQueries do
  @moduledoc """
  Module responsible for handling tasks queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | Tasks.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  #### PRIVATE

  @spec base() :: Tasks.t()
  defp base, do: CompanyManagement.Task.Task
end
