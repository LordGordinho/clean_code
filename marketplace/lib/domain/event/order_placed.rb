class OrderPlaced
  attr_reader :order, :name
  
  def initialize(order)
    @order = order
    @name = "OrderPlaced"
  end
end