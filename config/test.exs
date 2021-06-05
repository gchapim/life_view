use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :life_web, LifeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :life_web, :grid,
  x_size: 7,
  y_size: 7,
  tick: 30,
  reset_tick_multiplier: 10,
  start_delay: 20,
  initial_state: [{2, 1}, {2, 2}, {2, 3}]
