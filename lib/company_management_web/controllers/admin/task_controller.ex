defmodule CompanyManagementWeb.Admin.TaskController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Task.Task

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Task.changeset(%Task{}, %{})
    render(conn, "new.html", changeset: changeset)
  end
end
