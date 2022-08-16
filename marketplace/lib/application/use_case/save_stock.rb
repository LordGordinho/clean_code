require_relative '../../domain/entity/stock_entry'

class SaveStock
  def initialize(repository_factory)
    @repository_factory = repository_factory
    @stock_entry_repository = repository_factory.create_stock_entry_repository
  end

  def execute(save_stock_input)
    @stock_entry_repository.save(StockEntry.new(save_stock_input["id_item"], save_stock_input["operation"], save_stock_input["quantity"], Date.parse(save_stock_input["date"])))
  end
end