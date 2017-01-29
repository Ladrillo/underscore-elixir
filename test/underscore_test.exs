defmodule UnderscoreTest do
  use ExUnit.Case
  doctest Underscore

  test "first" do
    assert Underscore.first([1, 2, 3, 4]) == 1
    assert Underscore.first([1, 2, 3, 4], 2) == [1, 2]
    assert Underscore.first([1, 2, 3, 4], 5) == [1, 2, 3, 4]
  end

  test "last" do
    assert Underscore.last([1, 2, 3, 4]) == 4
    assert Underscore.last([1, 2, 3, 4], 2) == [3, 4]
    assert Underscore.last([1, 2, 3, 4], 0) == []
    assert Underscore.last([1, 2, 3, 4], 5) == [1, 2, 3, 4]
  end

  test "indexOf" do
    assert Underscore.indexOf([1, 2, 3, 4], 1) == 0
    assert Underscore.indexOf([1, 2, 3, 4], 2) == 1
    assert Underscore.indexOf([1, 2, 3, 4], 4) == 3
    assert Underscore.indexOf([1, 2, 3, 4], 5) == -1
  end
end
