defmodule ParenthesesTest do
  use ExUnit.Case
  doctest Parentheses

  test "Parentheses.balance_check/1 checks if a string's parentheses are balanced" do
    assert Parentheses.balance_check("Khai") == true
    assert Parentheses.balance_check("{Khai") == false
    assert Parentheses.balance_check("{Khai}") == true
    assert Parentheses.balance_check("{Khai]}") == false
    assert Parentheses.balance_check("{Khai[]}") == true
    assert Parentheses.balance_check("{Kha)i[]}") == false
    assert Parentheses.balance_check("({Kha)i[]}") == false
    assert Parentheses.balance_check("(Kha)i[]}") == false
    assert Parentheses.balance_check("{(Kha)i[]}") == true
  end
end
