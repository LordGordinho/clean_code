class GetOrdersController
  def initialize(order_dao)
    @order_dao = order_dao
  end

  def execute(code)
    @order_dao.all.to_json
  end
end