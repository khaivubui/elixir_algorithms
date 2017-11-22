defmodule Sort.QuickSort do
  @moduledoc """
  Simple quick sort implementation
  """

  @doc """
  Simple quick sort implementation

  ## Examples

      iex> import Sort.QuickSort
      iex> quick_sort [38, 27, 43, 3, 9, 82, 10]
      [3, 9, 10, 27, 38, 43, 82]

  """
  def quick_sort([]), do: []
  def quick_sort([el | []]), do: [el]
  def quick_sort([pivot | list]) do
    {left, right} = list |> split(pivot, {[], []})
    quick_sort(left) ++ [pivot] ++ quick_sort(right)
  end

  defp split([], _pivot, result), do: result
  defp split([current | list], pivot, result) do
    {left, right} = result
    case current < pivot do
      true -> split list, pivot, {[current | left], right}
      false -> split list, pivot, {left, [current | right]}
    end
  end
end
