defmodule CompanyManagementWeb.Users.UserController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Users
  alias CompanyManagement.Users.User

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    user_details = conn.assigns.current_user.id |> Users.get_user_by_id()
    render(conn, :index, user_details: user_details)
  end

  @spec edit(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def edit(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, :edit, changeset: changeset)
  end
end
