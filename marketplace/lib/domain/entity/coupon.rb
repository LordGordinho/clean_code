require 'date'

class Coupon
  WITHOUT_DISCOUNT = 0

  attr_reader :code, :percentage
  
  def initialize(code, percentage, expiration_date = nil)
    @code = code
    @percentage = percentage
    @expiration_date = expiration_date
  end

  def expired?(today = Date.today)
    !self.valid?(today = Date.today)
  end

  def valid?(today = Date.today)
    return true unless @expiration_date

    @expiration_date >= today
  end

  def calculate_discount(value)
    return WITHOUT_DISCOUNT if self.expired?

    value * (@percentage/100.0)
  end
end