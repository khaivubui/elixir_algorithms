defmodule MinMaxStack do
  @moduledoc """
  Stack implementation that has constant access to min and max
  """

  defstruct [:min, :max, min_hist: [], max_hist: [], store: []]

  @doc """
  Pushes an item to the stack

  ## Examples

      iex> %Stack{} |> Stack.push(1)
      %Stack{store: [1]}
      iex> %Stack{} |> Stack.push(1) |> Stack.push("apple")
      %Stack{store: ["apple", 1]}

  """
  def push stack, item do
    store = [item | stack.store]
    [max | _] = max_hist = push_to_max_hist(stack.max_hist, item)
    [min | _] = min_hist = push_to_min_hist(stack.min_hist, item)
    %MinMaxStack{
      min: min, max: max, min_hist: min_hist, max_hist: max_hist, store: store
    }
  end

  defp push_to_max_hist([], item), do: [item]

  defp push_to_max_hist [max | _] = max_hist, item do
    if item >= max do
      [item | max_hist]
    else
      max_hist
    end
  end

  defp push_to_min_hist([], item), do: [item]

  defp push_to_min_hist [min | _] = min_hist, item do
    if item <= min do
      [item | min_hist]
    else
      min_hist
    end
  end

  @doc """
  pops an item from the stack. Returns a tuple with stack and the item

  ## Examples

      iex> %Stack{store: ["super", "man"]} |> Stack.pop
      {%Stack{store: ["man"]}, "super"}
      iex> %Stack{store: ["man"]} |> Stack.pop
      {%Stack{store: []}, "man"}

  """
  def pop stack do
    [item | store] = stack.store
    [max | _] = max_hist = pop_from_hist(stack.max_hist, item)
    [min | _] = min_hist = pop_from_hist(stack.min_hist, item)

    min_max_stack = %MinMaxStack{
      min: min, max: max, min_hist: min_hist, max_hist: max_hist, store: store
    }

    {min_max_stack, item}
  end

  defp pop_from_hist([], _item), do: []

  defp pop_from_hist([minmax | remaining_hist] = hist, item) do
    if item == minmax do
      remaining_hist
    else
      hist
    end
  end
end
