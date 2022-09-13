defmodule CompanyManagement.Company.UserQueries do
  @moduledoc """
  Module responsible for handling user queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | User.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  @spec order_by_column(Ecto.Query.t() | User.t(), atom()) :: Ecto.Query.t()
  def order_by_column(query \\ base(), column) do
    query
    |> order_by(^column)
  end

  #### PRIVATE

  @spec base() :: User.t()
  defp base, do: CompanyManagement.Company.User
end
