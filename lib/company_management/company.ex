defmodule CompanyManagement.Company do
  @moduledoc """
  Main context of Company
  """

  # aliases
  alias CompanyManagement.Company.Companies
  alias CompanyManagement.Company.Users

  # Users

  defdelegate get_user_by_id(id), to: Users

  defdelegate list_users, to: Users

  defdelegate update_user(user, updated_user), to: Users

  defdelegate delete_user(user), to: Users

  # Company

  defdelegate get_company_by_id(id), to: Companies
end
