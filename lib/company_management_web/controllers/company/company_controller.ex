defmodule CompanyManagementWeb.Company.CompanyController do
  use CompanyManagementWeb, :controller

  # aliases
  alias CompanyManagement.Company

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
