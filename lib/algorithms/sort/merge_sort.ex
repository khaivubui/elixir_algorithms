defmodule Sort.MergeSort do
  @moduledoc """
  Basic merge sort implementation
  """

  @doc """
  Basic merge sort implementation

  ## Examples

      iex> import Sort.MergeSort
      iex> merge_sort [38, 27, 43, 3, 9, 82, 10]
      [3, 9, 10, 27, 38, 43, 82]
  """
  def merge_sort([]), do: []
  def merge_sort([item | []]), do: [item]

  def merge_sort list do
    mid_index = length(list) |> Integer.floor_div(2)
    left_list = list |> Enum.take(mid_index) |> merge_sort
    right_list = list |> Enum.drop(mid_index) |> merge_sort
    left_list |> merge(right_list, [])
  end

  defp merge([], [], result), do: result |> Enum.reverse

  defp merge [], [r_item | r_remain], result do
    merge [], r_remain, [r_item | result]
  end

  defp merge [l_item | l_remain], [], result do
    merge l_remain, [], [l_item | result]
  end

  defp merge [l_item | l_remain] = l_list, [r_item | r_remain] = r_list, result do
    case l_item < r_item do
      true -> merge l_remain, r_list, [l_item | result]
      false -> merge l_list, r_remain, [r_item | result]
    end
  end
end
