defmodule CompanyManagement.Company.UsersValidation do
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
    |> validate_birthdate()
  end

  @spec validate_birthdate(Ecto.Changeset.t()) :: Ecto.Changeset.t()
  defp validate_birthdate(%Changeset{} = changeset) do
    case birth_date = get_field(changeset, :birth_date) do
      nil ->
        changeset

      _ ->
        changeset
        |> greater_or_equal_today(birth_date)
    end
  end

  ### HELPERS

  @spec greater_or_equal_today(Ecto.Changeset.t(), Date.t()) :: Ecto.Changeset.t()
  defp greater_or_equal_today(changeset, birth_date) do
    if Date.compare(birth_date, Date.utc_today()) == :gt ||
         Date.compare(birth_date, Date.utc_today()) == :eq do
      add_error(changeset, :birth_date, "Birthdate cannot be larger or the same as Today's date.")
    else
      changeset
    end
  end
end
