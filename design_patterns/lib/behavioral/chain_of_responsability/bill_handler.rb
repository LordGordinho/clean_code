require_relative 'handler'

class BillHandler < Handler
  attr_reader :next_handler, :type
  
  def initialize(next_handler, type)
    @next_handler = next_handler
    @type = type
  end

  def handler(bills, amount)
    quantity = (amount/@type).floor
    bills << { quantity: quantity, type: @type }
    remaining = amount % @type
    @next_handler.handler(bills, remaining) if @next_handler
    bills
  end
end