defmodule MinMaxQueue do
  defstruct [in_stack: %MinMaxStack{}, out_stack: %MinMaxStack{}, store: []]
end
