defmodule CompanyManagementWeb.Admin.TaskController do
  use CompanyManagementWeb, :controller

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    # changeset
    render(conn, "new.html")
  end
end
