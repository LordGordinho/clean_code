require 'domain/repository/item_repository'

class ItemRepositoryMemory < ItemRepository
  def initialize
    @items = [
      Item.new(1, "Instrumentos Musicais", "Guitarra", 1000),
      Item.new(2, "Instrumentos Musicais", "Amplificador", 5000),
      Item.new(3, "Instrumentos Musicais", "Cabo", 30)
    ]
  end

  def find_by_id(item_id)
    @items.find { |item| item.item_id === item_id }
  end
end