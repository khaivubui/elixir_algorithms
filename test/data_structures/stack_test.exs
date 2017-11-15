defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "enqueues and dequeues correctly" do
    stack = %Stack{store: ["chair"]} |> Stack.push(%{})
    assert stack == %Stack{store: [%{}, "chair"]}

    {stack, item} = stack |> Stack.pop
    assert stack == %Stack{store: ["chair"]}
    assert item == %{}
  end
end
