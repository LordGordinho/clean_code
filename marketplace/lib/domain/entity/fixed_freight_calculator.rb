require_relative 'freight_calculator'

class FixedFreightCalculator < FreightCalculator
  FIXED_FREIGHT_PRICE = 10

  def calculate(item, distance = 1000)
    FIXED_FREIGHT_PRICE
  end
end