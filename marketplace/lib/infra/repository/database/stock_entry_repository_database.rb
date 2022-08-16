require_relative '../../../domain/repository/stock_entry_repository'
require_relative '../../../domain/entity/stock_entry'

class StockEntryRepositoryDatabase < StockEntryRepository
  def initialize(connection)
    @connection = connection
  end

	def save(stock_entry)
		@connection.query('insert into "stock_entry" (id_item, operation, quantity, date) values ($1, $2, $3, $4)', [stock_entry.id_item, stock_entry.operation, stock_entry.quantity, stock_entry.date.to_s])
	end

  def find_by_id_item(id_item)
    stock_entries = []
    stock_entries_data = @connection.query('SELECT * FROM "stock_entry" WHERE "stock_entry"."id_item" = $1', [id_item]) do |result|
      result.map do |row|
        row
      end
    end

    stock_entries_data.each do |stock_entry_data|
      p stock_entry_data
      stock_entries.push(StockEntry.new(stock_entry_data['id_item'].to_i, stock_entry_data['operation'], stock_entry_data['quantity'].to_i, Date.parse(stock_entry_data['date'])))
    end

    stock_entries
  end

  def clear
    @connection.query("delete from stock_entry", [])
  end
end