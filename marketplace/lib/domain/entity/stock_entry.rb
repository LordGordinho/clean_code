class StockEntry
  attr_reader :id_item, :operation, :quantity, :date

  def initialize(id_item, operation, quantity, date)
    @id_item = id_item
    @operation = operation
    @quantity = quantity
    @date = date
  end
end