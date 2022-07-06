class PlaceOrder
  def initialize(item_repository, order_repository)
    @item_repository = item_repository
    @order_repository = order_repository
  end

  def execute(input)
    order = Order.new(input[:cpf])
    input[:order_items].each do |order_items|
      item = @item_repository.find_by_id(order_items[:id_item]) 
      order.add_item(item, order_items[:quantity])
    end
    @order_repository.save(order)
    return {
      total: order.total_price
    }
  end
end