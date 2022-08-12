class GetOrders
  def initialize(order_dao)
    @order_dao = order_dao
  end

  def execute
    @order_dao.all
  end
end