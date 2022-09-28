defmodule CompanyManagementWeb.Company.CompanyController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Company

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    company =
      conn.assigns.current_user.company_id
      |> Company.get_company_by_id()

    render(conn, "index.html", company: company)
  end
end
