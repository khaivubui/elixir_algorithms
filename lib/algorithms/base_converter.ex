defmodule BaseConverter do
  @moduledoc """
  Simple base converter
  """
  @digits ~w(0 1 2 3 4 5 6 7 8 9 a b c d e f) |> List.to_tuple

  @doc """
  Simple base converter

  ## Examples

      iex> import BaseConverter
      iex> base_converter 10, 2
      "1010"
      iex> base_converter 10, 16
      "a"
      iex> base_converter 31, 16
      "1f"
      
  """
  def base_converter(0, _base), do: ""
  def base_converter num, b do
    smallest_digit = elem(@digits, rem(num, b))
    base_converter(Integer.floor_div(num, b), b) <> smallest_digit
  end
end
