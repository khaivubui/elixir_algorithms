defmodule StringCondenser do
  def string_condenser string do
    string
      |> String.graphemes
      |> Enum.chunk_by(& &1)
      |> Enum.map(fn(chunk) ->
        (chunk |> length |> to_string) <> (chunk |> hd)
      end)
      |> Enum.join
  end

  def string_decondenser string do
    string
      |> String.graphemes
      |> Enum.chunk_by(& &1 =~ ~r/\d/)
      |> Enum.map(& &1 |> Enum.join)
      |> Enum.chunk_every(2)
      |> Enum.map(fn(chunk) ->
        chunk
          |> List.last
          |> String.duplicate(chunk |> hd |> String.to_integer)
      end)
  end
end
