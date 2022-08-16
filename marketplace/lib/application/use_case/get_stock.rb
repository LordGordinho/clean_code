require_relative '../../domain/service/stock_calculator'

class GetStock
  def initialize(repository_factory)
    @stock_entry_repository = repository_factory.create_stock_entry_repository
  end

  def execute(id_item)
    stock_entries = @stock_entry_repository.find_by_id_item(id_item)
    calculator = StockCalculator.new

    calculator.calculate(stock_entries)
  end
end