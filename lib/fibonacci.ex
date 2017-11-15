defmodule Fibonacci do
  @moduledoc """
  Find the nth number of the fibonacci sequence.
  """

  @doc """
  Find the nth number of the fibonacci sequence in exponential time complexity

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
end
