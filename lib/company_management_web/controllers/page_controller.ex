defmodule CompanyManagementWeb.PageController do
  use CompanyManagementWeb, :controller

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
