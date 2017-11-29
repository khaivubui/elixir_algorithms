defmodule BaseConverter do
  @digits ~w(0 1 2 3 4 5 6 7 8 9 a b c d e f) |> List.to_tuple

  def base_converter(0, _base), do: ""
  def base_converter num, b do
    smallest_digit = elem(@digits, rem(num, b))
    base_converter(Integer.floor_div(num, b), b) <> smallest_digit
  end
end
