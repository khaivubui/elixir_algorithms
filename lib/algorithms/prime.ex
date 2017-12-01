defmodule Prime do
  @moduledoc """
  Prime related fucntions
  """

  @doc """
  Takes a number and returns a list of that many numbers

  ## Examples

      iex> Prime.primes 10
      [2,3,5,7,11,13,17,19,23,29]
  """
  def primes count do
    primes_step 2, [], 0, count
  end

  defp primes_step(_num, result, count, target_count) when count == target_count do
    result |> Enum.reverse
  end

  defp primes_step num, result, count, target_count do
    case is_prime? num do
      true -> primes_step(num + 1, [num | result], count + 1, target_count)
      false -> primes_step(num + 1, result, count, target_count)
    end
  end

  def is_prime?(num) when num < 2, do: false
  def is_prime? num do
    is_prime_step num, num - 1
  end

  defp is_prime_step(_num, 1), do: true
  defp is_prime_step num, divisor do
    case rem(num, divisor) do
      0 -> false
      _ -> is_prime_step num, divisor - 1
    end
  end
end
