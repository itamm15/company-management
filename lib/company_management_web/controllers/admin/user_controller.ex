defmodule CompanyManagementWeb.Admin.UserController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Company

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    users = Company.list_users()
    render(conn, "index.html", users: users)
  end
end
