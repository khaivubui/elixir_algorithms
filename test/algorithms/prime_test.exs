defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "Prime.primes/1 returns a list of primes" do
    assert Prime.primes(2) == [2,3]
    assert Prime.primes(8) == [2,3,5,7,11,13,17,19]
    assert Prime.primes(15) == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]
  end

  test "Prime.is_prime?/1 checks if a number is prime" do
    assert Prime.is_prime?(7) == true
    assert Prime.is_prime?(8) == false
    assert Prime.is_prime?(19) == true
  end
end
