require_relative '../../application/use_case/place_order.rb'

class PlaceOrderController
  def initialize(repository_factory, broker)
    @repository_factory = repository_factory
    @broker = broker
  end

  def execute(body, params = {})
    place_order = PlaceOrder.new(@repository_factory, @broker) 
    output = place_order.execute(body)
  
    output.to_json
  end
end