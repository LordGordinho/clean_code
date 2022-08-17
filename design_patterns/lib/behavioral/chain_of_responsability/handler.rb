class Handler
  attr_reader :next_handler, :type
  
  def initialize(next_handler, type)
    @next_handler = next_handler
    @type = type
  end

  def handler(bills, amount)
    raise NotImplementedError "Errors #{__method__}"
  end
end