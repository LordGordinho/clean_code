require_relative '../../application/use_case/place_order.rb'

class PlaceOrderController
  def initialize(repository_factory)
    @repository_factory = repository_factory
  end

  def execute(body, params = {})
    place_order = PlaceOrder.new(@repository_factory) 
    output = place_order.execute(body)
  
    output.to_json
  end
end