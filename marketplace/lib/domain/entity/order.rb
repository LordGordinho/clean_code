require_relative 'order_item'
require_relative 'default_freight_calculator'
require_relative 'order_code'

class Order
  attr_reader :cpf, :order_items, :coupon, :freight, :issue_date, :code, :sequence

  def initialize(cpf, issue_date = Date.today, freight_calculator = DefaultFreightCalculator.new, sequence = 1)
    raise Exception.new "Document Invalid" unless Document.document_valid?(cpf)
    
    @order_items  = []
    @issue_date = issue_date || Date.today
    @freight_calculator = freight_calculator || DefaultFreightCalculator.new
    @freight = 0
    @cpf = Document.new(cpf)
    @sequence = sequence
    @code = OrderCode.new((issue_date || Date.today), sequence).value
  end

  def total_price
    total_order_price = @order_items.reduce(0) do |accumulator, order_item|
      accumulator += order_item.total_price
    end

    return (total_order_price - @coupon.calculate_discount(total_order_price)) + @freight if @coupon 

    total_order_price + @freight
  end

  def add_coupon(coupon)
    return if coupon.expired?(@issue_date)
    @coupon = coupon
  end

  def add_item(item, quantity)
    @freight += @freight_calculator.calculate(item) * quantity;

    @order_items = [*@order_items, OrderItem.new(item.item_id, item.price, quantity)]
  end
end