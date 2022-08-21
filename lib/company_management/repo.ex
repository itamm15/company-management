defmodule CompanyManagement.Repo do
  use Ecto.Repo,
    otp_app: :company_management,
    adapter: Ecto.Adapters.Postgres
end
