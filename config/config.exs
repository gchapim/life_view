# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :life_web,
  generators: [context_app: :life]

# Configures the endpoint
config :life_web, LifeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YQGDubkOQM5RkqDQ16ZezHZOT7hUqvnVjJdThfSLG1W7LMbCJ3iADuloxd3zEJTj",
  render_errors: [view: LifeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Life.PubSub,
  live_view: [signing_salt: "YHHOjxPu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Default grid config
import_config "grid.exs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
