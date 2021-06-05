defmodule LifeWeb.Helpers.Grid do
  def x_size do
    grid_config()[:x_size]
  end

  def y_size do
    grid_config()[:y_size]
  end

  def tick do
    grid_config()[:tick]
  end

  def start_delay do
    grid_config()[:start_delay]
  end

  def reset_tick_multiplier do
    grid_config()[:reset_tick_multiplier]
  end

  def initial_state do
    grid_config()[:initial_state]
  end

  defp grid_config do
    Application.fetch_env!(:life_web, :grid)
  end
end
