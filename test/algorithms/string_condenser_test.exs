defmodule StringCondenserTest do
  use ExUnit.Case
  doctest StringCondenser
  import StringCondenser

  test "condenses a string" do
    assert StringCondenser.string_condenser("aaabb") == "3a2b"
    assert StringCondenser.string_condenser("aaaaaabbc") == "6a2b1c"
  end

  test "decondenses a string" do
    assert StringCondenser.string_decondenser("3a2b") == "aaabb"
    assert StringCondenser.string_decondenser("6a2b1c") == "aaaaaabbc"
  end
end
