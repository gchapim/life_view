# LiveView's Game of Life

Conway's Game of Life implementation using Phoenix LiveView.

![ezgif-7-2fad6e52d271](https://user-images.githubusercontent.com/1141813/120896908-09181080-c5fa-11eb-8f10-e300a95fc1ff.gif)

## Details

Life is an umbrella application to better separate the core game module (`Life`) from the interface (`LifeWeb`).
This way it's easier to extract the core implementation to use with other interfaces (like terminal or a different framework).

The main modules are `Life.Grid` (game core functions) and `LifeWeb.PageLive` (LiveView implementation).
For now the initial input comes from the configured defined inside `config/grid.exs`. As we only keep track of the alive cells, all you need to do to change the initial input is to add the two-dimensional alive positions as tuples to the List.

## To-do

- [ ] Show the current generation count
- [ ] Add Start/Pause/Reset buttons
- [ ] Enable initial input editing from the webpage
- [ ] Add tick speed controls
- [ ] Improve style

## Running
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
