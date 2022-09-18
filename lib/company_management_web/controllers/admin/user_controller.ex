defmodule CompanyManagementWeb.Admin.UserController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Company
  alias CompanyManagement.Company.User

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    users = Company.list_users()
    render(conn, "index.html", users: users)
  end

  @spec edit(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def edit(conn, %{"id" => id}) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "edit.html", changeset: changeset, user: Company.get_user_by_id(id))
  end

  @spec update(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "user" => user}) do
    Company.get_user_by_id(id)
    |> Company.update_user(user)
    |> case do
      {:ok, _updated} ->
        conn
        |> put_flash(:info, "User updated successfuly.")
        |> redirect(to: Routes.admin_user_path(conn, :index))

      {:error, error} ->
        conn
        |> render("edit.html", changeset: error, user: Company.get_user_by_id(id))
    end
  end

  @spec delete(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def delete(conn, %{"id" => id}) do
    Company.get_user_by_id(id)
    |> Company.delete_user()
    |> case do
      {:ok, _deleted} ->
        conn
        |> put_flash(:info, "User deleted successfuly.")
        |> redirect(to: Routes.admin_user_path(conn, :index))

      {:error, _error} ->
        conn
        |> put_flash(:error, "Could not delete user.")
        |> redirect(to: Routes.admin_user_path(conn, :index))
    end
  end
end
