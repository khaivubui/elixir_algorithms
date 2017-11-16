defmodule TwoSum do
  def two_sum numbers, sum do
    tracker = MapSet.new(numbers)
    two_sum_step numbers, sum, tracker, []
  end

  def two_sum_step([], _sum, tracker, result), do: result

  def two_sum_step [current | r_numbers] = numbers, sum, tracker, result do
    difference = sum - current
    if MapSet.member?(tracker, difference)  do
      tracker = tracker |> MapSet.delete(difference) |> MapSet.delete(current)
      two_sum_step r_numbers, sum, tracker, [[current, difference] | result]
    else
      two_sum_step r_numbers, sum, tracker, result
    end
  end
end
