defmodule MinMaxStack do
  @moduledoc """
  Stack implementation that has constant access to min and max
  """

  defstruct [:min, :max, min_hist: [], max_hist: [], store: []]

  @doc """
  Pushes an item to the stack

  ## Examples

      iex> mmstack = %MinMaxStack{} |> MinMaxStack.push(1) |> MinMaxStack.push(55)
      %MinMaxStack{max: 55, max_hist: [55, 1], min: 1, min_hist: [1], store: [55, 1]}
      iex> mmstack.min
      1
      iex> mmstack.max
      55
      iex> mmstack = mmstack |> MinMaxStack.push(-100)
      %MinMaxStack{max: 55, max_hist: [55, 1], min: -100, min_hist: [-100,1], store: [-100, 55, 1]}
      iex> mmstack.min
      -100

  """
  def push stack, item do
    store = [item | stack.store]
    [max | _] = max_hist = push_to_hist(stack.max_hist, item, &>=/2)
    [min | _] = min_hist = push_to_hist(stack.min_hist, item, &<=/2)
    %MinMaxStack{
      min: min, max: max,
      min_hist: min_hist, max_hist: max_hist,
      store: store
    }
  end

  defp push_to_hist([], item, _comparator), do: [item]

  defp push_to_hist([minmax | _] = hist, item, comparator) do
    if comparator.(item, minmax) do
      [item | hist]
    else
      hist
    end
  end

  @doc """
  pops an item from the stack. Returns a tuple with stack and the item

  ## Examples



  """
  def pop stack do
    [item | store] = stack.store
    [max | _] = max_hist = pop_from_hist(stack.max_hist, item)
    [min | _] = min_hist = pop_from_hist(stack.min_hist, item)

    min_max_stack = %MinMaxStack{
      min: min, max: max,
      min_hist: min_hist, max_hist: max_hist,
      store: store
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
