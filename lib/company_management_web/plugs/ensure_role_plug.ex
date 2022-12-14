defmodule CompanyManagementWeb.EnsureRolePlug do
  @moduledoc """
  Module responsible for ensuring user role

    ## Example

      plug CompanyManagementWeb.EnsureRolePlug, :admin
  """

  import Plug.Conn, only: [halt: 1]

  alias CompanyManagementWeb.Router.Helpers, as: Routes
  alias Phoenix.Controller
  alias Plug.Conn
  alias Pow.Plug

  @doc false
  @spec init(any()) :: any()
  def init(config), do: config

  @doc false
  @spec call(Conn.t(), atom() | binary() | [atom()] | [binary()]) :: Conn.t()
  def call(conn, roles) do
    conn
    |> Plug.current_user()
    |> has_role?(roles)
    |> maybe_halt(conn)
  end

  defp has_role?(nil, _roles), do: false
  defp has_role?(user, roles) when is_list(roles), do: Enum.any?(roles, &has_role?(user, &1))
  defp has_role?(user, role) when is_atom(role), do: has_role?(user, Atom.to_string(role))
  defp has_role?(%{role: role}, role), do: true

  defp has_role?(user, role) do
    user
    |> Map.get(:role)
    |> case do
      nil ->
        false

      user_role ->
        user_role == role or user_role == String.to_atom(role)
    end
  end

  defp maybe_halt(true, conn), do: conn

  defp maybe_halt(_any, conn) do
    conn
    |> Controller.put_flash(:error, "Unauthorized access")
    |> Controller.redirect(to: Routes.page_path(conn, :index))
    |> halt()
  end
end
