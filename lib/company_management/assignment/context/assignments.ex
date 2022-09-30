defmodule CompanyManagement.Assignment.Assignments do
  @moduledoc """
  Subcontext of assignment
  """

  # aliases
  alias CompanyManagement.Assignment.Assignment
  alias CompanyManagement.Assignment.AssignmentQueries
  alias CompanyManagement.Repo

  @spec get_assignment(String.t() | integer()) :: nil | Assignment.t()
  def get_assignment(id) do
    AssignmentQueries.all()
    |> Repo.get(id)
  end

  @spec list_assignments_summary(String.t() | integer()) ::
          list(ongoing: integer(), pending: integer(), review: integer(), finished: integer())
  def list_assignments_summary(company_id) do
    AssignmentQueries.all()
    |> AssignmentQueries.join_users()
    |> AssignmentQueries.where_company_id(company_id)
    |> AssignmentQueries.assignments_summary()
    |> AssignmentQueries.group_by_column(:status)
    |> Repo.all()
  end

  @spec list_assignments_for_given_user(String.t() | integer()) :: list(Assignment.t())
  def list_assignments_for_given_user(user_id) do
    AssignmentQueries.all()
    |> AssignmentQueries.where_user_id(user_id)
    |> Repo.all()
  end

  @spec list_assignments(list()) :: list(Assignment.t())
  def list_assignments(preloads \\ []) do
    AssignmentQueries.all()
    |> Repo.all()
    |> Repo.preload(preloads)
  end

  @spec create_assignment(map()) :: {:ok, Assignment.t()} | {:error, Ecto.Changeset.t()}
  def create_assignment(assignment) do
    %Assignment{}
    |> Assignment.changeset(assignment)
    |> Repo.insert()
  end

  @spec update_assignment(Assignment.t(), map()) ::
          {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def update_assignment(assignment, updated_assignment) do
    assignment
    |> Assignment.changeset(updated_assignment)
    |> Repo.update()
  end

  @spec delete_assignment(Assignment.t()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def delete_assignment(assignment) do
    assignment
    |> Repo.delete()
  end
end
