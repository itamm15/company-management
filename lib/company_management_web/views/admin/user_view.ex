defmodule CompanyManagementWeb.Admin.UserView do
  use CompanyManagementWeb, :view

  import Phoenix.HTML

  @spec display_links(Plug.Conn.t(), String.t() | integer()) :: {:safe, binary()}
  def display_links(conn, id) do
    ~E"""
      <%= link "Edit", to: Routes.admin_user_path(conn, :edit, id), class: "btn btn-primary" %>
      <%= link "Delete", to: Routes.admin_user_path(conn, :delete, id), class: "btn btn-danger", method: :delete %>
    """
  end
end
