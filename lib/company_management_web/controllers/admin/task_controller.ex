defmodule CompanyManagementWeb.Admin.TaskController do
  use CompanyManagementWeb, :controller

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    IO.inspect(conn, label: "conn")
    render(conn, "index.html")
  end
end
