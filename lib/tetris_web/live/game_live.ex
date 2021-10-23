defmodule TetrisWeb.GameLive do
  use TetrisWeb, :live_view
  alias Tetris.Tetromino

  def mount(_params, _session, socket) do
    :timer.send_interval(500, :tick)
    {:ok, socket |> new_tetromino}
  end

  def new_tetromino(socket) do
    assign(socket, tetro: Tetromino.new_shape)
  end

  def render(assigns) do
    ~L"""
      <h1> hello: <%= inspect @tetro %> </h1>
    """
  end

  def down(%{assigns: %{tetro: tetro}} = socket) do
    assign(socket, tetro: Tetromino.down(tetro))
  end

  def handle_info(:tick, socket) do
    {:noreply, down(socket)}
  end
end
