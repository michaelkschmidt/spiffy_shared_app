defmodule SpiffyToolsTest do
  use ExUnit.Case
  doctest SpiffyTools

  test "greets the world" do
    assert SpiffyTools.hello() == :world
  end
end
