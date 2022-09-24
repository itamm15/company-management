defmodule CompanyManagementWeb.Admin.AssignmentView do
  use CompanyManagementWeb, :view

  @spec list_users(list()) :: list()
  def list_users(users_list) do
    users_list
    |> Enum.map(fn %{id: id, email: email} -> [key: email, value: id] end)
  end

  @spec list_statuses() :: list()
  def list_statuses do
    [
      [
        key: "pending",
        value: "pending"
      ],
      [
        key: "ongoing",
        value: "ongoing"
      ],
      [
        key: "review",
        value: "review"
      ],
      [
        key: "finished",
        value: "finished"
      ]
    ]
  end

  @spec full_user_name(map()) :: String.t()
  def full_user_name(%{user: %{first_name: first_name, last_name: last_name}}) do
    first_name <> " " <> last_name
  end
end
