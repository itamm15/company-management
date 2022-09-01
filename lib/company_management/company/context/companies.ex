defmodule CompanyManagement.Company.Companies do
  @moduledoc """
  Subcontext of company
  """

  # aliases
  alias CompanyManagement.Repo
  alias CompanyManagement.Company.Company

  @spec get_compan_by_id(String.t() | integer()) :: nil | Company.t()
  def get_compan_by_id(id) do
    Company
    |> Repo.get(id)
  end
end
