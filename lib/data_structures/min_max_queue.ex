defmodule MinMaxQueue do
  import MinMaxStack

  defstruct [:min, :max, in_stack: %MinMaxStack{}, out_stack: %MinMaxStack{}]

  def enqueue mm_q, item do
    in_stack = mm_q.in_stack |> push(item)
    %{mm_q | in_stack: in_stack} |> update_min_max
  end

  def dequeue %MinMaxQueue{out_stack: %MinMaxStack{store: []}} = mm_q do
    mm_q = fill_out_stack mm_q
    dequeue mm_q
  end

  def dequeue mm_q do
    {out_stack, item} = mm_q.out_stack |> pop()
    mm_q = %{mm_q | out_stack: out_stack} |> update_min_max
    {mm_q, item}
  end

  defp update_min_max %{in_stack: in_stack, out_stack: out_stack} = mm_q do
    max = case [in_stack.max, out_stack.max] do
      [max1, nil] -> max1
      [nil, max2] -> max2
      [max1, max2] -> max(max1, max2)
    end

    min = case [in_stack.min, out_stack.min] do
      [min1, nil] -> min1
      [nil, min2] -> min2
      [min1, min2] -> min(min1, min2)
    end

    %{mm_q | min: min, max: max}
  end

  defp fill_out_stack %MinMaxQueue{in_stack: %MinMaxStack{store: []}} = mm_q do
    mm_q
  end

  defp fill_out_stack mm_q do
    {in_stack, item} = mm_q.in_stack |> pop()
    out_stack = mm_q.out_stack |> push(item)
    fill_out_stack %{mm_q | out_stack: out_stack, in_stack: in_stack}
  end
end
