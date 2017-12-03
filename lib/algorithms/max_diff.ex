defmodule MaxDiff do
  @moduledoc """
  Maximum difference between two elements such that larger element appears after the smaller number
  """

  @doc """
  Maximum difference between two elements such that larger element appears after the smaller number

  ## Examples

      iex> MaxDiff.max_diff [2, 3, 10, 6, 4, 8, 1]
      8
      iex> MaxDiff.max_diff [7, 9, 5, 6, 3, 2]
      2

  """
  def max_diff([first_el | [second_el | list]]) do
    max_diff = second_el - first_el
    min_el = first_el
    max_diff_step(list, max_diff, min_el)
  end

  def max_diff_step([], max_diff, _min_el), do: max_diff
  def max_diff_step([current_el | list], max_diff, min_el) do
    cond do
      current_el - min_el > max_diff ->
        max_diff_step(list, current_el - min_el, min_el)
      current_el < min_el ->
        max_diff_step(list, max_diff, current_el)
      true ->
        max_diff_step(list, max_diff, min_el)
    end
  end
end
