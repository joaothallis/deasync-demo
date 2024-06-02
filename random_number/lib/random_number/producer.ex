defmodule RandomNumber.Producer do
  @topic "request_random_number"

  @behaviour :erlkaf_producer_callbacks

  def create_producer do
    :erlkaf.start()

    producer_config = [ bootstrap_servers: "localhost:9092" ]

    :ok = :erlkaf.create_producer(:client_producer, producer_config)
    :ok = :erlkaf.create_topic(:client_producer, @topic, [request_required_acks: -1])
  end

  def produce(key, value) do
    :ok = :erlkaf.produce(:client_producer, @topic, key, value)
  end
end
