defmodule Life.Grid do
  defstruct data: MapSet.new()

  @neighbours_offset [
    {-1, -1},
    {-1, 0},
    {-1, 1},
    {0, -1},
    {0, 1},
    {1, -1},
    {1, 0},
    {1, 1}
  ]
  def new(alive_positions) do
    %__MODULE__{data: MapSet.new(alive_positions)}
  end

  def alive?(%__MODULE__{data: data}, position) do
    MapSet.member?(data, position)
  end

  defp neighbours({x_position, y_position}) do
    Stream.map(@neighbours_offset, fn {x_nb_position, y_nb_position} ->
      {x_position + x_nb_position, y_position + y_nb_position}
    end)
  end

  def next_grid(%__MODULE__{data: data} = grid) do
    data
    |> Stream.flat_map(&[&1 | &1 |> neighbours() |> Enum.to_list()])
    |> Stream.filter(&next_alive?(grid, &1))
    |> new()
  end

  defp next_alive?(grid, position) do
    do_next_alive?(alive?(grid, position), alive_neighbours_count(grid, position))
  end

  defp do_next_alive?(true = _alive, nb_count) when nb_count == 2 or nb_count == 3, do: true
  defp do_next_alive?(false = _alive, 3), do: true
  defp do_next_alive?(_, _), do: false

  defp alive_neighbours_count(grid, position) do
    position
    |> neighbours()
    |> Enum.reduce(0, fn nb_position, acc ->
      if alive?(grid, nb_position), do: acc + 1, else: acc
    end)
  end
end
