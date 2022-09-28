defmodule CompanyManagement.Company.CompaniesQueries do
  @moduledoc """
  Module responsible for handling companies queries
  """

  import Ecto.Query

  @spec all(Ecto.Query.t() | Company.t()) :: Ecto.Query.t()
  def all(query \\ base()), do: query

  #### PRIVATE

  @spec base() :: Company.t()
  def base, do: CompanyManagement.Company.Company
end
