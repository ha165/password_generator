defmodule ControlflowElixirTest do
  use ExUnit.Case
  doctest ControlflowElixir

  test "greets the world" do
    assert ControlflowElixir.hello() == :world
  end
end
