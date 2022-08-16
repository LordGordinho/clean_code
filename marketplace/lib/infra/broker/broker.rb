class Broker
  def initialize
    @handlers = []
  end

  def register(handler)
    @handlers << handler
  end

  def publish(event)
    @handlers.each do |handler|
      handler.handler(event) if event.name === handler.name
    end
  end
end