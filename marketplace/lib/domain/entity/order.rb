require 'domain/entity/order_item'

class Order
  attr_reader :cpf, :order_items, :coupon, :freight, :issue_date

  def initialize(cpf, issue_date = Date.today)
    raise Exception.new "Document Invalid" unless Document.document_valid?(cpf)
    
    @order_items  = []
    @issue_date = issue_date
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
end