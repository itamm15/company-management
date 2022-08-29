defmodule CompanyManagementWeb.Pow.RegistrationController do
  use CompanyManagementWeb, :controller

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Pow.Plug.change_user(conn)
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.create_user(user_params)
    |> case do
      {:ok, _user, conn} ->
        conn
        |> put_flash(:info, "Welcome!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, changeset, conn} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
