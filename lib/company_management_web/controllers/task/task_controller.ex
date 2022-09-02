defmodule CompanyManagementWeb.Task.TaskController do
  use CompanyManagementWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
