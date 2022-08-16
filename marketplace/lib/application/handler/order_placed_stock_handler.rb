class OrderPlacedStockHandler
  attr_reader :repository_factory, :stock_entry_repository, :name
  
  def initialize(repository_factory)
    @repository_factory = repository_factory
    @stock_entry_repository = repository_factory.create_stock_entry_repository
    @name = "OrderPlaced"
  end

  def handler(event)
    event.order.order_items.each do |order_item|
      @stock_entry_repository.save(StockEntry.new(order_item.item_id, 'out', order_item.quantity, event.order.issue_date))
    end
  end
end