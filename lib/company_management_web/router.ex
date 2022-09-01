defmodule CompanyManagementWeb.Router do
  use CompanyManagementWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CompanyManagementWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: CompanyManagementWeb.AuthErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", CompanyManagementWeb do
    pipe_through [:browser, :not_authenticated]

    get "/signup", Pow.RegistrationController, :new, as: :signup
    post "/signup", Pow.RegistrationController, :create, as: :signup
    get "/", Pow.SessionController, :new, as: :login
    post "/login", Pow.SessionController, :create, as: :login
  end

  scope "/", CompanyManagementWeb do
    pipe_through [:browser, :protected]

    scope "/" do
      resources "/user", Company.UserController
      resources "/company", Company.CompanyController
    end

    get "/page", PageController, :index
    delete "/logout", Pow.SessionController, :delete, as: :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", CompanyManagementWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CompanyManagementWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
