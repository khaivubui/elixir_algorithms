defmodule Sort.Sorted do
  @moduledoc """
  Simple bubble sort implementation
  """

  def sorted?([current | []]), do: true

  def sorted? [current | remaining] do
    [next | _] = remaining
    case current <= next do
      true -> sorted? remaining
      false -> false
    end
  end
end
