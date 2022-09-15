defmodule CompanyManagementWeb.Admin.TaskController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Task.Task
  alias CompanyManagement.Company

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Task.changeset(%Task{}, %{})
    users_list = Company.list_users()
    render(conn, "new.html", changeset: changeset, users_list: users_list)
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"task" => task}) do
  end
end
