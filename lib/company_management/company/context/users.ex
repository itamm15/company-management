defmodule CompanyManagement.Company.Users do
  @moduledoc """
  Subcontext of users
  """

  # aliases
  alias CompanyManagement.Repo
  alias CompanyManagement.Company.User
  alias CompanyManagement.Company.UserQueries

  @spec get_user_by_id(String.t() | integer()) :: nil | User.t()
  def get_user_by_id(id) do
    UserQueries.all()
    |> Repo.get(id)
  end

  @spec list_users :: list()
  def list_users() do
    UserQueries.all()
    |> UserQueries.order_by_column(:id)
    |> Repo.all()
  end

  @spec update_user(User.t(), map()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def update_user(user, updated_list) do
    user
    |> User.changeset(updated_list)
    |> Repo.update()
  end

  ### ROLES

  @spec create_user_with_role(map(), String.t() | binary()) ::
          {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def create_user_with_role(attrs, role) do
    %User{}
    |> User.changeset(attrs)
    |> User.role_changeset(%{role: role})
    |> Repo.insert()
  end

  @spec set_role(map(), String.t() | binary()) ::
          {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def set_role(user, role) do
    user
    |> User.role_changeset(%{role: role})
    |> Repo.update()
  end
end
