defmodule Sort do
  def merge_sort([]), do: []
  def merge_sort([item | []]), do: [item]

  def merge_sort list do
    mid_index = length(list) |> Integer.floor_div(2)
    left_list = list |> Enum.take(mid_index) |> merge_sort
    right_list = list |> Enum.drop(mid_index) |> merge_sort
    left_list |> merge(right_list, [])
  end

  defp merge([], right_list, result), do: result ++ right_list

  defp merge(left_list, [], result), do: result ++ left_list

  defp merge [l_item | l_remain] = l_list, [r_item | r_remain] = r_list, result do
    case l_item < r_item do
      true -> merge l_remain, r_list, result ++ [l_item]
      false -> merge l_list, r_remain, result ++ [r_item]
    end
  end
end
