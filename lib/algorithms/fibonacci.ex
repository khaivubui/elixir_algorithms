defmodule Fibonacci do
  @moduledoc """
  Finds the nth number of the fibonacci sequence.
  """

  @doc """
  Finds the nth number of the fibonacci sequence in exponential time complexity

  ## Examples

      iex> Fibonacci.exponential_fib 1
      1
      iex> Fibonacci.exponential_fib 10
      55

  """
  def exponential_fib(n) when n < 2, do: n

  def exponential_fib(n) do
    exponential_fib(n - 1) + exponential_fib(n - 2)
  end

  @doc """
  Finds the nth number of the fibonacci sequence in linear time complexity

  Examples

      iex> Fibonacci.linear_fib 1
      1
      iex> Fibonacci.linear_fib 10
      55

  """
  def linear_fib(0), do: 0

  def linear_fib(n), do: linear_fib_step(0, 1, 1, n)

  defp linear_fib_step(_prev, curr, curr_i, target_i) when curr_i == target_i do
    curr
  end

  defp linear_fib_step(prev, curr, curr_i, target_i) do
    linear_fib_step(curr, curr + prev, curr_i + 1, target_i)
  end
end
