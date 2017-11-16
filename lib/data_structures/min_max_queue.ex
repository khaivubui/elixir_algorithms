defmodule MinMaxQueue do
  import MinMaxStack

  defstruct [:min, :max, in_stack: %MinMaxStack{}, out_stack: %MinMaxStack{}]

  def enqueue mm_q, item do
    in_stack = mm_q.in_stack |> push(item)
    %{mm_q | in_stack: in_stack}
  end

  def dequeue %MinMaxQueue{out_stack: %MinMaxStack{store: []}} = mm_q do
    mm_q = fill_out_stack mm_q
    dequeue mm_q
  end

  def dequeue mm_q do
    {out_stack, item} = mm_q.out_stack |> pop()
    {%{mm_q | out_stack: out_stack}, item}
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
