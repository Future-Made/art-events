# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :future_made,
  ecto_repos: [FutureMade.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :future_made, FutureMadeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eslq7lm2vYKApS+CjRVjPZoQF6obBz/ElcQbFMa4rFPvGzb7GnXhQqG7VtdcpeOw",
  render_errors: [view: FutureMadeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FutureMade.PubSub,
  live_view: [signing_salt: "tdlb/vOk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Config event store
config :future_made, FutureMade.Core.EventStore,
  username: "postgres",
  password: "postgres",
  database: "future_made_eventstore_dev",
  hostname: "localhost",
  # Commanded.Serialization.JsonSerializer
  serializer: EventStore.TermSerializer

config :future_made, event_stores: [FutureMade.Core.EventStore]

config :future_made, FutureMade.Core,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: FutureMade.Core.EventStore
  ],
  pubsub: :local,
  registry: :local
