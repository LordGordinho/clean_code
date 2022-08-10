require_relative '../../domain/entity/default_freight_calculator'

class SimulateFreight
  def initialize(repository_factory, freight_calculator = nil)
    @item_repository = repository_factory.create_item_repository
    @freight_calculator = freight_calculator || DefaultFreightCalculator.new
  end

  def execute(input)
    total_freigth = 0 
    input["order_items"].each do |order_item|
      item = @item_repository.find_by_id(order_item["id_item"]) 
      total_freigth += @freight_calculator.calculate(item) * order_item["quantity"]
    end

    {
      "total_freigth" => total_freigth
    }
  end
end