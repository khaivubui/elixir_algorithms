defmodule StringCondenser do
  def string_condenser string do
    string
      |> String.graphemes
      |> Enum.chunk_by(& &1)
      |> Enum.map(& (&1 |> length |> to_string) <> (&1 |> hd))
      |> Enum.join
  end

  def string_decondenser do
    
  end
end
