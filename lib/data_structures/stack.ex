defmodule Stack do
  @doc """
  Stack implementation
  """
  
  defstruct store: []

  def push stack, item do
    %Stack{store: [item | stack.store]}
  end

  def pop stack do
    [item | stack] = stack
    {stack, item}
  end
end
