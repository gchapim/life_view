defmodule Life.GridTest do
  use ExUnit.Case, async: true

  alias Life.Grid

  describe "without grid" do
    test "new/1 returns new grid" do
      alive_positions = [{1, 0}, {1, 1}]

      assert Grid.new(alive_positions) == %Grid{data: MapSet.new(alive_positions)}
    end
  end

  describe "with grid" do
    @blinker [
      {2, 1},
      {2, 2},
      {2, 3}
    ]

    setup do
      grid = Grid.new(@blinker)

      empty_grid = Grid.new([])

      %{grid: grid, empty_grid: empty_grid}
    end

    test "alive?/2 for alive position", %{grid: grid} do
      assert Grid.alive?(grid, {2, 1})
    end

    test "alive?/2 for dead position", %{grid: grid} do
      refute Grid.alive?(grid, {0, 1})
    end

    test "alive?/2 for empty grid", %{empty_grid: empty_grid} do
      refute Grid.alive?(empty_grid, {2, 1})
    end

    test "next_grid/1 for grid", %{grid: grid} do
      assert Grid.next_grid(grid) == %Grid{data: MapSet.new([{1, 2}, {2, 2}, {3, 2}])}
    end

    test "next_grid/1 for empty grid", %{empty_grid: empty_grid} do
      assert Grid.next_grid(empty_grid) == %Grid{data: MapSet.new([])}
    end
  end
end
