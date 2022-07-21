require 'securerandom'

class Item
  attr_reader :description, :price, :category, :item_id, :density, :width, :height, :depth, :weight

  def initialize(item_id, category, description, price, width = nil, height = nil, depth = nil, weight = nil)
    @item_id = item_id
    @category = category 
    @description = description
    @price = price
    @width = width
    @height = height
    @depth = depth
    @weight = weight
  end

  def density
    return 0 unless @weight
    @weight.to_f/size.to_f
  end

  def size
    return 0 unless @width && @height && @depth

    (@width.to_f/100.0 * @height.to_f/100.0 * @depth.to_f/100.0)
  end
end