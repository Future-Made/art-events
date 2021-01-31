defmodule FutureMade.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      FutureMade.Core,
      # Start the Ecto repository
      FutureMade.Repo,
      # Start the Telemetry supervisor
      FutureMadeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FutureMade.PubSub},
      # Start the Endpoint (http/https)
      FutureMadeWeb.Endpoint
      # Start a worker by calling: FutureMade.Worker.start_link(arg)
      # {FutureMade.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FutureMade.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FutureMadeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
