defmodule CoinChange do
  @moduledoc """
  Finds the minimum coin set given a target value and coin options
  """

  @doc """
  Finds the minimum coin set given a target value and coin options

  ## Examples

    iex> CoinChange.min_coinset 2, [1, 5, 7, 10]
    [1, 1]
    iex> CoinChange.min_coinset 5, [1, 5, 7, 10]
    [5]
    iex> CoinChange.min_coinset 11, [1, 5, 7, 10]
    [1, 10]
    iex> CoinChange.min_coinset 12, [1, 5, 7, 10]
    [5, 7]

  """
  def min_coinset(target, coins) do
    cond do
      target in coins -> [target]

      true ->
        for coin <- coins, coin < target do
          [coin] ++ min_coinset(target - coin, coins)
        end
        |> Enum.min_by(&length/1)
    end
  end
end
