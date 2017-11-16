defmodule TwoSum do
  @doc """
  Takes a list of numbers and a target sum, returns a list of pairs that add up to the target sum

  ## Examples

      iex> TwoSum.two_sum [1, 2, 3, 4, 5, 6], 7
      [[1, 6], [2, 5], [3, 4]]
      iex> TwoSum.two_sum [3, 5, 2, -4, 8, 11], 7
      [[-4, 11], [5, 2]]
      
  """
  def two_sum numbers, sum do
    tracker = MapSet.new(numbers)
    two_sum_step numbers, sum, tracker, []
  end

  defp two_sum_step([], _sum, tracker, result), do: result

  defp two_sum_step [current | r_numbers] = numbers, sum, tracker, result do
    difference = sum - current
    if MapSet.member?(tracker, difference)  do
      tracker = tracker |> MapSet.delete(difference) |> MapSet.delete(current)
      two_sum_step r_numbers, sum, tracker, [[current, difference] | result]
    else
      two_sum_step r_numbers, sum, tracker, result
    end
  end
end
