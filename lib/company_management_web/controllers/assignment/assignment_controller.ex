defmodule CompanyManagementWeb.Assignment.AssignmentController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Assignment

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    assignments =
      conn.assigns.current_user.id
      |> Assignment.list_assignments_for_given_user()

    render(conn, "index.html", assignments: assignments)
  end
end
