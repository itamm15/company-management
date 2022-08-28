defmodule CompanyManagementWeb.Users.UserView do
  use CompanyManagementWeb, :view

  @spec format_naive_date(NaiveDateTime.t()) :: Date.t()
  def format_naive_date(date), do: NaiveDateTime.to_date(date)

end
