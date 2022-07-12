require 'application/use_case/place_order_input'
require 'application/use_case/place_order_output'

class PlaceOrder
  def initialize(item_repository, order_repository, coupon_repository)
    @item_repository = item_repository
    @order_repository = order_repository
    @coupon_repository = coupon_repository
  end

  def execute(input)
    @place_order_input = PlaceOrderInput.new(input)
    order = Order.new(@place_order_input.cpf, @place_order_input.date)
    @place_order_input.order_items.each do |order_items|
      item = @item_repository.find_by_id(order_items[:id_item]) 
      order.add_item(item, order_items[:quantity])
    end
    if @place_order_input.coupon
      coupon = @coupon_repository.find_by_code(@place_order_input.coupon)
      order.add_coupon(coupon)
    end
    @order_repository.save(order)
    @place_order_output = PlaceOrderOutput.new(order.total_price)
    return @place_order_output
  end
end