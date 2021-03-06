defmodule TwoSum do
  @moduledoc """
  Finds pairs of numbers from a list that add to a target sum
  """

  @doc """
  Takes a list of numbers and a target sum, returns a list of pairs that add up to the target sum

  ## Examples

      iex> TwoSum.two_sum [1, 2, 3, 4, 5, 6], 7
      [[3, 4], [2, 5], [1, 6]]
      iex> TwoSum.two_sum [3, 5, 2, -4, 8, 11], 7
      [[-4, 11], [5, 2]]
      iex> TwoSum.two_sum [2, 2, 2], 4
      [[2, 2]]

  """
  def two_sum numbers, sum do
    counter_map = to_counter_map numbers, %{}
    two_sum_step numbers, sum, counter_map, []
  end

  defp to_counter_map([] = _numbers, counter_map), do: counter_map

  defp to_counter_map([current | numbers], counter_map) do
    counter_map = counter_map |> Map.update(current, 1, & &1 + 1)
    to_counter_map(numbers, counter_map)
  end

  defp two_sum_step([] = _numbers, _sum, _counter_map, result), do: result

  defp two_sum_step([current | numbers], sum, counter_map, result) do
    difference = sum - current
    counter_map = counter_map |> Map.update!(current, & &1 - 1)
    case counter_map |> Map.get(difference, 0) do
      count when count <= 0 ->
        two_sum_step numbers, sum, counter_map, result
      _ ->
        counter_map = counter_map |> Map.update!(difference, & &1 - 1)
        two_sum_step numbers, sum, counter_map, [[current, difference] | result]
    end
  end
end
