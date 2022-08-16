require_relative '../controller/validate_coupon_controller'
require_relative '../controller/place_order_controller'
require_relative '../controller/simulate_freight_controller'
require_relative '../controller/get_order_controller'
require_relative '../controller/get_orders_controller'
require_relative '../../application/query/get_item'

require_relative 'http'

class RouteConfig < Http
  def initialize(http, repository_factory, order_dao, item_dao, broker)
    http.on('/orders', "post") do
      body = JSON.parse request.body.read
      PlaceOrderController.new(repository_factory, broker).execute(body)
    end

    http.on('/simulate_freight', "post") do
      data = JSON.parse request.body.read
      SimulateFreightController.new(repository_factory).execute(data)
    end
    
    http.on('/validate_coupon', "post") do
      data = JSON.parse request.body.read
    
      validate_coupon = ValidateCoupon.new(repository_factory)
      validate_coupon.execute(data).to_json
    end

    http.on('/orders/:code', 'get') do
      GetOrderController.new(order_dao).execute(params["code"])
    end

    http.on('/orders', 'get') do
      GetOrdersController.new(order_dao).execute(params["code"])
    end

    http.on('/items', 'get') do
      GetItem.new(item_dao).execute.to_json
    end
  end
end