defmodule CompanyManagementWeb.Admin.AssignmentController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Assignment.Assignment, as: Assignments
  alias CompanyManagement.Assignment
  alias CompanyManagement.Company

  plug(:assign_users_list when action in [:new, :create, :edit, :update])
  plug(:assign_assignment when action in [:edit, :update])

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    assignments = Assignment.list_assignments([:user])
    render(conn, "index.html", assignments: assignments)
  end

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Assignments.changeset(%Assignments{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"assignment" => assignment}) do
    assignment
    |> Assignment.create_assignment()
    |> case do
      {:ok, _assignment} ->
        conn
        |> put_flash(:info, "Assignment created succesfully.")
        |> redirect(to: Routes.admin_assignment_path(conn, :index))

      {:error, error} ->
        conn
        |> put_flash(:error, "Could not create assignment, please follow below errors.")
        |> render("new.html", changeset: error)
    end
  end

  @spec edit(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def edit(conn, _params) do
    changeset = Assignments.changeset(%Assignments{}, %{})
    render(conn, "edit.html", changeset: changeset)
  end

  #### PRIVATE

  @spec assign_users_list(Plug.Conn.t(), any()) :: Plug.Conn.t()
  defp assign_users_list(conn, _params) do
    assign(conn, :users_list, Company.list_users())
  end

  @spec assign_assignment(Plug.Conn.t(), any()) :: Plug.Conn.t()
  defp assign_assignment(conn, _params) do
    assignment = Assignment.get_assignment(conn.params["id"])
    assign(conn, :assignment, assignment)
  end
end
