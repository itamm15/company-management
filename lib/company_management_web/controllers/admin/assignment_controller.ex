defmodule CompanyManagementWeb.Admin.AssignmentController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Assignment.Assignment
  alias CompanyManagement.Company

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Assignment.changeset(%Assignment{}, %{})
    users_list = Company.list_users()
    render(conn, "new.html", changeset: changeset, users_list: users_list)
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"task" => task}) do
  end
end
