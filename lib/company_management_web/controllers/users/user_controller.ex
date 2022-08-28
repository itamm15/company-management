defmodule CompanyManagementWeb.Users.UserController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Users

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    user_details = conn.assigns.current_user.id |> Users.get_user_by_id()
    render(conn, :index, user_details: user_details)
  end
end