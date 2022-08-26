defmodule CompanyManagement.Users do
  @moduledoc """
  Users context
  """

  # aliases
  alias CompanyManagement.Users.UsersContext

  # Users

  defdelegate get_user_by_id(id), to: UsersContext
end
