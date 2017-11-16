defmodule TwoSum do
  @doc """
  Takes a list of numbers and a target sum, returns a list of pairs that add up to the target sum

  ## Examples

      iex> TwoSum.two_sum [1, 2, 3, 4, 5, 6], 7
      [[3, 4], [2, 5], [1, 6]]
      iex> TwoSum.two_sum [3, 5, 2, -4, 8, 11], 7
      [[-4, 11], [5, 2]]

  """
  def two_sum numbers, sum do
    tracker = MapSet.new(numbers)
    two_sum_step numbers, sum, tracker, []
  end

  defp two_sum_step([], _sum, _tracker, result), do: result

  defp two_sum_step [current | numbers], sum, tracker, result do
    difference = sum - current
    if MapSet.member?(tracker, difference)  do
      tracker = tracker |> MapSet.delete(difference) |> MapSet.delete(current)
      two_sum_step numbers, sum, tracker, [[current, difference] | result]
    else
      two_sum_step numbers, sum, tracker, result
    end
  end
end
