require 'domain/repository/item_repository'

class ItemRepositoryMemory < ItemRepository
  def initialize
    @items = [
      Item.new(1, "Instrumentos Musicais", "Guitarra", 1000),
      Item.new(2, "Instrumentos Musicais", "Amplificador", 5000),
      Item.new(3, "Instrumentos Musicais", "Cabo", 30),
      Item.new(4, 'Casa', 'Sofa', 3000, 100, 30, 10, 3), 
      Item.new(5, 'Casa', 'Cama', 5000, 100, 50, 50, 20), 
      Item.new(6, 'Casa', 'Geladeira', 4000, 10, 10, 10, 0.9)

    ]
  end

  def find_by_id(item_id)
    @items.find { |item| item.item_id === item_id }
  end
end