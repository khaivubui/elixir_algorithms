defmodule Stack do
  @moduledoc """
  Stack implementation
  """

  defstruct store: []

  @doc """
  Pushes an item to the stack

  ## Examples

      iex> %Stack{} |> Stack.push(1)
      %Stack{store: [1]}
      iex> %Stack{} |> Stack.push(1) |> Stack.push("apple")
      %Stack{store: ["apple", 1]}

  """
  def push stack, item do
    %Stack{store: [item | stack.store]}
  end

  def pop stack do
    [item | store] = stack.store
    {%Stack{store: store}, item}
  end
end
