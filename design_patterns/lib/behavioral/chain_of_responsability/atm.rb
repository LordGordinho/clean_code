class Atm
  def initialize(handler)
    @handler = handler
  end

  def withdraw(amount)
    bills = []
    @handler.handler(bills, amount)
  end
end