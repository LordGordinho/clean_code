class PlaceOrder
  def initialize(item_repository, order_repository, coupon_repository)
    @item_repository = item_repository
    @order_repository = order_repository
    @coupon_repository = coupon_repository
  end

  def execute(input)
    order = Order.new(input[:cpf], input[:date])
    input[:order_items].each do |order_item|
      item = @item_repository.find_by_id(order_item[:id_item]) 
      order.add_item(item, order_item[:quantity])
    end
    if input[:coupon]
      coupon = @coupon_repository.find_by_code(input[:coupon])
      order.add_coupon(coupon)
    end
    @order_repository.save(order)

    {
      total: order.total_price
    }
  end
end