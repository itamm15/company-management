defmodule CompanyManagement.Users.UsersValidation do
  @moduledoc """
  Module responsible for validating users.
  """

  # import
  import Ecto.Changeset

  # aliases
  alias Ecto.Changeset

  @spec user_validation(Ecto.Changeset.t()) :: Ecto.Changeset.t()
  def user_validation(%Changeset{} = changeset) do
    changeset
  end
end
