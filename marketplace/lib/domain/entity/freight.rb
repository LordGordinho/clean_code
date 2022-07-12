class Freight
  MINIMUM_PRICE = 10

  def price(item, item_quantity = 1, distance = 1000)
    return 0 unless item.size && @item.density
    
    shipping_price = (distance * @item.size * (item.density/100.0)) * item_quantity

    MINIMUM_PRICE > shipping_price ? MINIMUM_PRICE : shipping_price
  end
end