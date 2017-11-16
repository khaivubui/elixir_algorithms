defmodule CoinChangeTest do
  use ExUnit.Case
  doctest CoinChange

  test "CoinChange.min_coinset/2 finds smallest coin set" do
    assert CoinChange.min_coinset(1, [1, 5, 7, 10]) == [1]
    assert CoinChange.min_coinset(2, [1, 5, 7, 10]) == [1,1]
    assert CoinChange.min_coinset(3, [1, 5, 7, 10]) == [1,1,1]
    assert CoinChange.min_coinset(4, [1, 5, 7, 10]) == [1,1,1,1]
    assert CoinChange.min_coinset(5, [1, 5, 7, 10]) == [5]
    assert CoinChange.min_coinset(6, [1, 5, 7, 10]) == [1,5]
    assert CoinChange.min_coinset(7, [1, 5, 7, 10]) == [7]
    assert CoinChange.min_coinset(8, [1, 5, 7, 10]) == [1,7]
    assert CoinChange.min_coinset(9, [1, 5, 7, 10]) == [1,1,7]
    assert CoinChange.min_coinset(10, [1, 5, 7, 10]) == [10]
    assert CoinChange.min_coinset(11, [1, 5, 7, 10]) == [1,10]
    assert CoinChange.min_coinset(12, [1, 5, 7, 10]) == [5,7]
  end
end
