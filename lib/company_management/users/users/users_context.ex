defmodule CompanyManagement.Users.UsersContext do
  @moduledoc """
  Subcontext of users
  """

  # aliases
  alias CompanyManagement.Users.User
  alias CompanyManagement.Repo

  @spec get_user_by_id(String.t() | integer()) :: nil | User.t()
  def get_user_by_id(id) do
    User
    |> Repo.get(id)
  end
end
