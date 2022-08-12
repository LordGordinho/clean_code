class GetOrder
  def initialize(order_dao)
    @order_dao = order_dao
  end

  def execute(code)
    @order_dao.find_by_code(code)
  end
end