require_relative '../../application/dao/item_dao'

class ItemDaoDatabase < ItemDao
  def initialize(connection)
    @connection = connection
  end

  def all
    @connection.query('SELECT * FROM "item"') do |result|
      result.map do |row|
        { 
          **row,
          "price" => row["price"].to_f  
        }
      end
    end
  end
end