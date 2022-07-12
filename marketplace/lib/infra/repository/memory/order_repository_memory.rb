require 'domain/repository/order_repository'

class OrderRepositoryMemory < OrderRepository
  attr_reader :orders
  
  def initialize
    @orders = []
  end

  def save(order)
    order.generate_code(self)
    @orders << order
  end

  def last_order
    @orders.last
  end
end