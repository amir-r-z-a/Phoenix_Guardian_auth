defmodule AuthGuard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AuthGuardWeb.Telemetry,
      # Start the Ecto repository
      AuthGuard.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AuthGuard.PubSub},
      # Start Finch
      {Finch, name: AuthGuard.Finch},
      # Start the Endpoint (http/https)
      AuthGuardWeb.Endpoint
      # Start a worker by calling: AuthGuard.Worker.start_link(arg)
      # {AuthGuard.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AuthGuard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AuthGuardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
