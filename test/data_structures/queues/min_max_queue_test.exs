defmodule MinMaxQueueTest do
  use ExUnit.Case
  doctest MinMaxQueue

  import MinMaxQueue

  test "MinMaxQueue keeps track of min and max through enqueue and dequeue" do
    mm_q = %MinMaxQueue{} |> enqueue(1) |> enqueue(2)
    assert mm_q.min == 1
    assert mm_q.max == 2

    mm_q = mm_q |> enqueue(3) |> enqueue(4)
    assert mm_q.min == 1
    assert mm_q.max == 4

    {mm_q, item} = mm_q |> dequeue
    assert mm_q.min == 2
    assert mm_q.max == 4
    assert item == 1

    {mm_q, item} = mm_q |> dequeue
    assert mm_q.min == 3
    assert mm_q.max == 4
    assert item == 2
  end
end
