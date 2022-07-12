class SimulateFreight
  def initialize(item_repository)
    @item_repository = item_repository
  end

  def execute(input)
    total_freigth = 0 
    input[:order_items].each do |order_item|
      item = @item_repository.find_by_id(order_item[:id_item]) 
      total_freigth += item.get_freight * order_item[:quantity]
    end

    {
      total_freigth: total_freigth
    }
  end
end