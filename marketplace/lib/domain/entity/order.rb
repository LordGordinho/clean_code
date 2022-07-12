require 'domain/entity/order_item'

class Order
  attr_reader :cpf, :order_items, :coupon, :freight, :issue_date, :code

  def initialize(cpf, issue_date = Date.today)
    raise Exception.new "Document Invalid" unless Document.document_valid?(cpf)
    
    @order_items  = []
    @issue_date = issue_date || Date.today
    @freight = 0
    @cpf = Document.new(cpf)
  end

  def total_price
    total_order_price = @order_items.reduce(0) do |accumulator, order_item|
      accumulator += order_item.total_price
    end

    return (total_order_price - @coupon.calculate_discount(total_order_price)) + @freight if @coupon 

    total_order_price
  end

  def add_coupon(coupon)
    return if coupon.expired?(@issue_date)
    @coupon = coupon
  end

  def add_item(item, quantity)
    @freight += item.get_freight * quantity;

    @order_items = [*@order_items, OrderItem.new(item.item_id, item.price, quantity)]
  end

  def generate_code(order_repository)
    last_order = order_repository.last_order

    return @code = "#{@issue_date.strftime("%Y")}00000001" unless last_order

    last_order_number_code = last_order.code.split(//).last(8).join.to_i
    next_number_code = sprintf('%08d', (last_order_number_code + 1))

    @code = "#{@issue_date.strftime("%Y")}#{next_number_code}"
  end
end