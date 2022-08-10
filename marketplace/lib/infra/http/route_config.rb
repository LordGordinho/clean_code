require_relative '../database/pg_connection'
require_relative '../repository/database/coupon_repository_database'
require_relative '../repository/database/item_repository_database'
require_relative '../repository/database/order_repository_database'

require_relative '../../application/use_case/validate_coupon'
require_relative '../../application/use_case/place_order'
require_relative '../../application/use_case/simulate_freight'

require_relative '../../domain/entity/default_freight_calculator.rb'
require_relative 'http'

class RouteConfig < Http
  def initialize(http, repository_factory)
    http.on('/simulate_freight', "post") do
      data = JSON.parse request.body.read
    
      connection = PgConnection.instance 
      item_repository = ItemRepositoryDatabase.new(connection)
      freight_calculator = DefaultFreightCalculator.new
    
      simulate_freight =  SimulateFreight.new(item_repository, freight_calculator)
      output = simulate_freight.execute(data)
    
      output.to_json
    end
    
    http.on('/validate_coupon', "post") do
      data = JSON.parse request.body.read
    
      connection = PgConnection.instance 
      coupon_repository = CouponRepositoryDatabase.new(connection) 
      validate_coupon = ValidateCoupon.new(coupon_repository)
    
      output = validate_coupon.execute(data)
    
      output.to_json
    end
        
    http.on('/place_order', "post") do
      data = JSON.parse request.body.read
    
      connection = PgConnection.instance 
      order_repository = OrderRepositoryDatabase.new(connection) 
      item_repository = ItemRepositoryDatabase.new(connection) 
      coupon_repository = CouponRepositoryDatabase.new(connection) 
      place_order = PlaceOrder.new(item_repository, order_repository, coupon_repository) 
    
      output = place_order.execute(data)
    
      output.to_json
    end
  end
end