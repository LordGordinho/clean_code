require_relative '../../application/dao/order_dao'

class OrderDaoDatabase < OrderDao
  def initialize(connection)
    @connection = connection
  end

  def find_by_code(code)
    @connection.query('SELECT * FROM "order" WHERE "order".code = $1', [code]) do |result|
      result.map do |row|
        { "code" => code, "total" => row["total"] }
      end.first
    end
  end

  def all
    @connection.query('SELECT * FROM "order"') do |result|
      result.map do |row|
        { "code" => row["code"], "total" => row["total"] }
      end
    end
  end
end