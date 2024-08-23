defmodule RandomNumber.Producer do
  @topic "request_random_number"

  @behaviour :erlkaf_producer_callbacks

  require Logger

  def create_producer do
    :erlkaf.start()

    producer_config = [bootstrap_servers: "localhost:9092"]

    # FIXME: it is not returning error if the server is down
    # it is only logging the errors
    :ok = :erlkaf.create_producer(:client_producer, producer_config)
    :ok = :erlkaf.create_topic(:client_producer, @topic, request_required_acks: -1)
  rescue
    exception ->
      Logger.error("Error to create producer", exception: inspect(exception))

      reraise(exception, __STACKTRACE__)
  end

  def produce(key, value) do
    :erlkaf.produce(:client_producer, @topic, key, value)
  rescue
    exception ->
      Logger.error("Error to produce message", exception: inspect(exception))

      reraise(exception, __STACKTRACE__)
  end
end
