defmodule Life.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Life.PubSub}
      # Start a worker by calling: Life.Worker.start_link(arg)
      # {Life.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Life.Supervisor)
  end
end
