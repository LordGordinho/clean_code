require_relative 'freight_calculator'

class DefaultFreightCalculator < FreightCalculator
  MINIMUM_PRICE = 10

  def calculate(item, distance = 1000)
    return 0 unless item.width && item.height && item.depth
    
    shipping_price = (distance * item.size * (item.density/100.0))

    MINIMUM_PRICE > shipping_price ? MINIMUM_PRICE : shipping_price
  end
end