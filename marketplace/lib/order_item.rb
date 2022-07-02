class OrderItem
  attr_reader :item_id, :price, :quantity

  def initialize(item_id, price, quantity)
    @item_id = item_id
    @price = price
    @quantity = quantity
  end

  def total_price
    @quantity * @price
  end
end