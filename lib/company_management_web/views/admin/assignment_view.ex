defmodule CompanyManagementWeb.Admin.AssignmentView do
  use CompanyManagementWeb, :view

  @spec list_users(list()) :: list()
  def list_users(users_list) do
    users_list
    |> Enum.map(fn %{id: id, email: email} -> [key: email, value: id] end)
  end
end
