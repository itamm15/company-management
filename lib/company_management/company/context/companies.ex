defmodule CompanyManagement.Company.Companies do
  @moduledoc """
  Subcontext of company
  """

  # aliases
  alias CompanyManagement.Repo
  alias CompanyManagement.Company.Company
  alias CompanyManagement.Company.CompaniesQueries

  @spec get_company_by_id(String.t() | integer()) :: nil | Company.t()
  def get_company_by_id(id) do
    CompaniesQueries.all()
    |> Repo.get(id)
  end
end
