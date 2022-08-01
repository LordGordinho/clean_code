class SearchOrders
  def initialize(repository_order)
    @repository_order = repository_order
  end

  def execute(input)
    order = @repository_order.find_by_code(input["code"])
    return { "error" => "Order not found" } unless order

    return { 
      "order" => {
        "id" => order.code,
        "items" => order.order_items.map { |order_item| { "item_id" => order_item.item_id, "quantity" => order_item.quantity } },
        "freight" => order.freight
      }
    }
  end
end