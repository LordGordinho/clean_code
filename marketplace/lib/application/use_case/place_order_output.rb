class PlaceOrderOutput
  attr_reader :total
  
  def initialize(total)
    @total = total
  end
end