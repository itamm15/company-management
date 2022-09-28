defmodule CompanyManagement.Assignment do
  @moduledoc """
  Main context of Task
  """

  # aliases
  alias CompanyManagement.Assignment.Assignments

  # Assignments

  defdelegate get_assignment(id), to: Assignments
  defdelegate list_assignments_for_given_user(user_id), to: Assignments
  defdelegate list_assignments(preloads), to: Assignments
  defdelegate create_assignment(assigment), to: Assignments
  defdelegate update_assignment(assignment, updated_assignment), to: Assignments
  defdelegate delete_assignment(assignment), to: Assignments
end
