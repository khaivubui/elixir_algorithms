defmodule Sort.Sorted do
  @moduledoc """
  Sorted checks
  """

  @doc """
  Simple sorted check

  ## Examples

      iex> sorted? [2,3,1]
      false
      iex> sorted? [2,3,4]
      true
      
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
