defmodule CompanyManagementWeb.SidebarView do
  use CompanyManagementWeb, :view

  @spec is_admin?(CompanyManagement.Company.User.t()) :: boolean()
  def is_admin?(%{role: "admin"}), do: true
  def is_admin?(_), do: false
end
