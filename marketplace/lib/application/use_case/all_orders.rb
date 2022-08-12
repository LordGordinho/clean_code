class AllOrders
  def initialize(repository_order)
    @repository_order = repository_order
  end

  def execute(input)
    orders = @repository_order.all

    {
      "orders" => orders.map do |order| 
        { 
          "order" => {
            "id" => order.code,
            "items" => order.order_items.map { |order_item| { "item_id" => order_item.item_id, "quantity" => order_item.quantity } },
            "freight" => order.freight
          }
        }
      end
    }
  end
end