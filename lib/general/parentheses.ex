defmodule Parentheses do
  @moduledoc """
  Checks if parentheses are balanced
  """

  @doc """
  Checks if parentheses are balanced

  ## Examples

    iex> Parentheses.balance_check "{Khai"
    false
    iex> Parentheses.balance_check "{Khai}"
    true
    iex> Parentheses.balance_check "{Khai]}"
    false
    iex> Parentheses.balance_check "{(Kha)i[]}"
    true

  """
  def balance_check string do
    string
    |> String.graphemes
    |> Enum.filter(& &1 in ["(", "[", "{", "}", "]", ")"] )
    |> balance_check_step([])
  end

  defp balance_check_step [], [] do
    true
  end

  defp balance_check_step paren_list, [] do
    [current_paren | paren_list] = paren_list
    balance_check_step paren_list, [current_paren]
  end

  defp balance_check_step [], _stack do
    false
  end

  defp balance_check_step paren_list, stack do
    parentheses = %{
      ")" => "(",
      "]" => "[",
      "}" => "{"
    }

    closers = Map.keys(parentheses)
    openers = Map.values(parentheses)
    [current_paren | paren_list] = paren_list
    [top_item | stack_remainder] = stack

    cond do
      current_paren in openers ->
        balance_check_step paren_list, [current_paren | stack]
      current_paren in closers && parentheses[current_paren] == top_item ->
        balance_check_step paren_list, stack_remainder
      true -> false
    end
  end
end
