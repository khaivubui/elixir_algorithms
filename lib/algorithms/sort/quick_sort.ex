defmodule Sort.QuickSort do
  def quick_sort(list) when list |> length < 2, do: list
  def quick_sort([pivot | list]) do
    {left, right} = list |> split(pivot, {[], []})
    quick_sort(left) ++ [pivot] ++ quick_sort(right)
  end

  def split([], _pivot, result), do: result
  def split([current | list], pivot, result) do
    {left, right} = result
    case current < pivot do
      true -> split list, pivot, {[current | left], right}
      false -> split list, pivot, {left, [current | right]}
    end
  end
end
