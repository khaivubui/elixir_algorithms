defmodule MinMaxStackTest do
  use ExUnit.Case
  doctest MinMaxStack

  import MinMaxStack

  test "has correct access to min and max through multiple pushes and pops" do
    mmstack = %MinMaxStack{} |> push(1) |> push(2)

    assert mmstack.min == 1
    assert mmstack.max == 2

    mmstack = mmstack |> push(-1) |> push(-2)

    assert mmstack.min == -2
    assert mmstack.max == 2

    {mmstack, item} = mmstack |> pop

    assert mmstack.min == -1
    assert mmstack.max == 2
    assert item == -2

    {mmstack, item} = mmstack |> pop

    assert mmstack.min == 1
    assert mmstack.max == 2
    assert item == -1
  end
end
