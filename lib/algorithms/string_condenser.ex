defmodule StringCondenser do
  @moduledoc """
  Module that condenses and decondenses strings
  """

  @doc """
  Condenses duplicated sequential letters in a string

  ## Examples

      iex> import StringCondenser
      iex> string_condenser "coolstuff"
      "1c2o1l1s1t1u2f"
      iex> string_condenser "niceeeee"
      "1n1i1c5e"

  """
  def string_condenser string do
    string
      |> String.graphemes
      |> Enum.chunk_by(& &1)
      |> Enum.map(fn(chunk) ->
        (chunk |> length |> to_string) <> (chunk |> hd)
      end)
      |> Enum.join
  end

  @doc """
  Decondenses output from string_condenser

  ## Examples

      iex> import StringCondenser
      iex> string_decondenser "1c2o1l1s1t1u2f"
      "coolstuff"
      iex> string_decondenser "1n1i1c5e"
      "niceeeee"

  """
  def string_decondenser string do
    string
      |> String.graphemes
      |> Enum.chunk_by(& &1 =~ ~r/\d/)
      |> Enum.map(& &1 |> Enum.join)
      |> Enum.chunk_every(2)
      |> Enum.map(fn([num | [char | []]]) ->
        char |> String.duplicate(num |> String.to_integer)
      end)
      |> Enum.join
  end
end
