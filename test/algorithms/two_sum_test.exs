defmodule TwoSumTest do
  use ExUnit.Case
  doctest TwoSum

  import TwoSum

  test "two_sum finds the pairs of numbers that sum up to the given sum" do
    assert two_sum([9, 1], 10) == [[9,1]]
    assert two_sum([9, 1], 11) == []
    assert two_sum([1, 2, 3, 4], 5) == [[2, 3], [1, 4]]
    assert two_sum([1, 2, 3, 4], 4) == [[1, 3]]
  end
end
