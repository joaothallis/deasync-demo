defmodule RandomNumber.ProducerTest do
  use ExUnit.Case, async: true

  test "produce" do
    assert :ok = RandomNumber.Producer.create_producer()
    assert :ok = RandomNumber.Producer.produce("key", "value")
  end
end
