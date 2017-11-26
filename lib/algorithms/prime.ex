defmodule Prime do
  def primes n do

  end

  def is_prime?(1), do: true
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
