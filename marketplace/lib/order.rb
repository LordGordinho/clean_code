require 'order_item'

class Order
  attr_reader :cpf, :order_items, :coupon, :shipping_distance

  def initialize(cpf, shipping_distance = 1000)
    raise Exception.new "Document Invalid" unless Document.document_valid?(cpf)
    
    @order_items = []
    @shipping_distance = shipping_distance
    @cpf = Document.new(cpf)
  end

  def total_price
    total_order_price = @order_items.reduce(0) do |accumulator, order_item|
      accumulator += order_item.total_price
    end

    return (total_order_price - @coupon.calculate_discount(total_order_price)) + total_price_shipping if @coupon 

    total_order_price
  end

  def total_price_shipping
    @order_items.reduce(0) do |accumulator, order_item|
      item = @items.find { |item| item.item_id === order_item.item_id }
      accumulator += Shipping.new(item, order_item.quantity, @shipping_distance).price
    end
  end

  def add_coupon(coupon)
    @coupon = coupon
  end

  def add_item(item, quantity)
    @items ||= Array.new

    new_order_item = OrderItem.new(item.item_id, item.price, quantity)

    @items = [*@items, item]

    @order_items = [*@order_items, new_order_item]
  end
end