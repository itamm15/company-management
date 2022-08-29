import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :company_management, CompanyManagement.Repo,
  username: "mateuszosinski",
  password: "",
  hostname: "localhost",
  database: "company_management_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :company_management, CompanyManagementWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "vUZqJofwEI8sgstXu37e6p37M6nbAYSRUsGNzUWOb38x/Ok1s9AxUoNzpOm0p9AY",
  server: false

# In test we don't send emails.
config :company_management, CompanyManagement.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
