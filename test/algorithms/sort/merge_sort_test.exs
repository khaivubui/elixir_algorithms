defmodule Sort.MergeSortTest do
  use ExUnit.Case
  doctest Sort.MergeSort
  import Sort.MergeSort

  test "sorts lists of numbers" do
    assert merge_sort([5,4,3,2,1]) == [1,2,3,4,5]
    assert merge_sort([99,4,22,-100,-24]) == [-100,-24,4,22,99]
    assert merge_sort([5,4,3,2,1,5,4,3,2,1]) == [1,1,2,2,3,3,4,4,5,5]
  end
end
