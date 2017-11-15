defmodule CoinChange do
  @moduledoc """
  Finds the minimum coin set given a target value and coin options
  """

  @doc """
  Finds the minimum coin set given a target value and coin options
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
