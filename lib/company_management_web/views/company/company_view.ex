defmodule CompanyManagementWeb.Company.CompanyView do
  use CompanyManagementWeb, :view

  @spec sum_assignments(list()) :: integer()
  def sum_assignments(assignments) do
    assignments
    |> Stream.map(fn {_status, value} -> value end)
    |> Enum.sum()
  end

  @spec format_assignments_value(integer() | nil) :: integer()
  def format_assignments_value(nil), do: 0
  def format_assignments_value(value), do: value
end
