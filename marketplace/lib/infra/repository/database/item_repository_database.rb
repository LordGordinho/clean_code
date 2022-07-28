require_relative '../../../domain/repository/item_repository'
require_relative '../../../domain/entity/item'

class ItemRepositoryDatabase < ItemRepository
  def initialize(connection)
    @connection = connection
  end

  def find_by_id(item_id)
    item_data = @connection.query("select * from item where id_item = $1", [item_id]) do |result|
      result.map do |row|
        row
      end.first
    end
		return if item_data.empty?
		return Item.new(item_data["id_item"], item_data["category"], item_data["description"], item_data["price"].to_f, item_data["width"], item_data["height"], item_data["length"], item_data["weight"]);
  end
end