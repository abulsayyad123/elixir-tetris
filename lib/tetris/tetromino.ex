# Sometimes we have something with attributes, like in this case
# we have shape, rotation and location.
#  double underscore means it is system level attributes or function. eg. __struct__
#
defmodule Tetris.Tetromino do
  defstruct shape: :l, rotation: 0, location: {5, 1}

  alias Tetris.Point

  def new(options \\ []) do
    __struct__(options)
  end

  def new_shape() do
    new(shape: random_shape())
  end

  def left(tetro) do
    %{tetro | location: Point.left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.right(tetro.location)}
  end

  def down(tetro) do
    %{tetro | location: Point.down(tetro.location)}
  end

  def rotate(tetro) do
    %{tetro | rotation: rotate_degress(tetro.rotation)}
  end

  defp random_shape() do
    ~w[i t o l j z s]a
    |> Enum.random
  end

  defp rotate_degress(270) do
    0
  end

  defp rotate_degress(n) do
    n + 90
  end
end
