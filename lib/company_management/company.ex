defmodule CompanyManagement.Company do
  @moduledoc """
  Main context of Company
  """

  # aliases
  alias CompanyManagement.Company.UsersContext

  # Users

  defdelegate get_user_by_id(id), to: UsersContext

  defdelegate update_user(user, updated_user), to: UsersContext
end
