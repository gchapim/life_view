defmodule LifeWeb.Helpers.GridTest do
  use ExUnit.Case, async: true

  alias LifeWeb.Helpers.Grid

  test "x_size/0" do
    assert Grid.x_size() == 7
  end

  test "y_size/0" do
    assert Grid.y_size() == 7
  end

  test "tick/0" do
    assert Grid.tick() == 30
  end

  test "start_delay/0" do
    assert Grid.start_delay() == 20
  end

  test "reset_tick_multiplier/0" do
    assert Grid.reset_tick_multiplier() == 10
  end

  test "initial_state/0" do
    assert Grid.initial_state() == [{2, 1}, {2, 2}, {2, 3}]
  end
end
