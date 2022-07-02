require 'securerandom'

class Item
  attr_reader :description, :price, :category, :item_id, :density

  def initialize(category, description, price, width = nil, height = nil, depth = nil, density = nil)
    @item_id = SecureRandom.hex(32)
    @category = category
    @description = description
    @price = price
    @width = width
    @height = height
    @depth = depth
    @density = density
  end

  def size
    return 0 unless @width && @height && @depth

    (@width * @height * @depth) / 1000000.0
  end
end