require_relative '../../domain/entity/order.rb'

class PlaceOrder
  def initialize(repository_factory)
    @item_repository = repository_factory.create_item_repository
    @order_repository = repository_factory.create_order_repository
    @coupon_repository = repository_factory.create_coupon_repository
  end

  def execute(input)
    sequence = @order_repository.count + 1
    date_order = input["date"].nil? ? nil : Date.parse(input["date"])
    order = Order.new(input["cpf"], date_order, nil, sequence)

    input["order_items"].each do |order_item|
      item = @item_repository.find_by_id(order_item["id_item"]) 
      order.add_item(item, order_item["quantity"])
    end

    if input["coupon"]
      coupon = @coupon_repository.find_by_code(input["coupon"])
      order.add_coupon(coupon)
    end

    @order_repository.save(order)

    { "total" => order.total_price }
  end
end