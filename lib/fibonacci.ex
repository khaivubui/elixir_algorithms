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
  """
end
