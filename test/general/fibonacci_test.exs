defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "finds nth fibonacci in exponential time" do
    assert Fibonacci.exponential_fib(1) == 1
    assert Fibonacci.exponential_fib(2) == 1
    assert Fibonacci.exponential_fib(3) == 2
    assert Fibonacci.exponential_fib(4) == 3
    assert Fibonacci.exponential_fib(5) == 5
    assert Fibonacci.exponential_fib(6) == 8
    assert Fibonacci.exponential_fib(7) == 13
    assert Fibonacci.exponential_fib(8) == 21
    assert Fibonacci.exponential_fib(9) == 34
    assert Fibonacci.exponential_fib(10) == 55
  end

  test "finds nth fibonacci in linear time" do
    assert Fibonacci.linear_fib(1) == 1
    assert Fibonacci.linear_fib(2) == 1
    assert Fibonacci.linear_fib(3) == 2
    assert Fibonacci.linear_fib(4) == 3
    assert Fibonacci.linear_fib(5) == 5
    assert Fibonacci.linear_fib(6) == 8
    assert Fibonacci.linear_fib(7) == 13
    assert Fibonacci.linear_fib(8) == 21
    assert Fibonacci.linear_fib(9) == 34
    assert Fibonacci.linear_fib(10) == 55
  end
end
