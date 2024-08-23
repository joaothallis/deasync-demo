defmodule RandomNumber.ProducerTest do
  use ExUnit.Case, async: true

  test "produce" do
    assert :ok = RandomNumber.Producer.create_producer()

    :timer.sleep(250)

    # FIXME: request_required_acks: -1 is not working and if I drop the server it's returning :ok
    # There is no log
    assert :ok = RandomNumber.Producer.produce("key", "value54")
  end
end
