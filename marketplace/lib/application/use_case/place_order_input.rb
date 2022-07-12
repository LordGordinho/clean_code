class PlaceOrderInput
  attr_reader :cpf, :order_items, :date, :coupon

  def initialize(input)
    @cpf = input[:cpf]
    @order_items = input[:order_items]
    @date = input[:date] || Date.today
    @coupon = input[:coupon]
  end
end