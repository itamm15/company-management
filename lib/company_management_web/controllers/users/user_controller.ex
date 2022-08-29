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
  def edit(conn, %{"id" => id}) do
    fields = %{
      changeset: User.changeset(%User{}, %{}),
      user_details: Users.get_user_by_id(id),
      id: id
    }

    render(conn, "index.html", fields)
  end
end
