defmodule LifeWeb.PageLive do
  use LifeWeb, :live_view

  import LifeWeb.Helpers.Grid

  alias Life.Grid

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, grid: set_grid(), grid_size: %{x: x_size(), y: y_size()})}
  end

  defp set_grid do
    grid = Grid.new(initial_state())

    send_tick(grid, start_delay())
    Process.send_after(self(), :reset, reset_tick_multiplier() * tick())

    grid
  end

  defp send_tick(grid, time \\ tick()) do
    Process.send_after(self(), {:tick, grid}, time)
  end

  @impl true
  def handle_info({:tick, grid}, socket) do
    grid = Grid.next_grid(grid)
    tick_ref = send_tick(grid)

    {:noreply, assign(socket, grid: grid, tick_ref: tick_ref)}
  end

  @impl true
  def handle_info(:reset, %{assigns: %{tick_ref: tick_ref}} = socket) do
    Process.cancel_timer(tick_ref)

    {:noreply, assign(socket, grid: set_grid())}
  end
end
