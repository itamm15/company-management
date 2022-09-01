defmodule CompanyManagementWeb.Company.UserController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Company
  alias CompanyManagement.Company.User

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    user_details = conn.assigns.current_user.id |> Company.get_user_by_id()
    render(conn, :index, user_details: user_details)
  end

  @spec edit(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def edit(conn, %{"id" => id, "changeset" => changeset}) do
    fields = %{
      changeset: format_changeset(changeset),
      user_details: Company.get_user_by_id(id),
      id: id
    }

    render(conn, "index.html", fields)
  end

  @spec update(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "user" => updated_user}) do
    user_details = Company.get_user_by_id(id)

    user_details
    |> Company.update_user(updated_user)
    |> case do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Updated user!")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, error} ->
        conn
        |> put_flash(:error, "Could not update user.")
        |> render(:edit, id: id, changeset: error)
    end
  end

  ### PRIVATE

  @spec format_changeset(String.t() | Ecto.Changeset.t()) :: Ecto.Changeset.t()
  defp format_changeset(""), do: User.changeset(%User{}, %{})
  defp format_changeset(changeset), do: changeset
end
