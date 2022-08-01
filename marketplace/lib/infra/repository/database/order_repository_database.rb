require_relative '../../../domain/repository/order_repository'

class OrderRepositoryDatabase < OrderRepository
  def initialize(connection)
    @connection = connection
  end

	def save(order)
		order_data = @connection.query('insert into "order" (code, cpf, issue_date, freight, sequence, coupon) values ($1, $2, $3, $4, $5, $6) returning  *', [order.code, order.cpf.document, order.issue_date, order.freight, order.sequence, order&.coupon&.code]) do |result|
      result.map do |row|
        row
      end.first
    end
		order.order_items.each do |order_item|
			@connection.query('insert into order_item (id_item, id_order, price, quantity) values ($1, $2, $3, $4)', [order_item.item_id, order_data["id_order"], order_item.price, order_item.quantity]);
    end

    order_data
	end

	def count
		order_data = @connection.query('select count(*)::int as count from "order"') do |result|
      result.map do |row|
        row
      end.first
    end

		order_data["count"].to_i
  end

  def find_by_code(code)
    @connection.query('SELECT * FROM "order" WHERE "order".code = $1', [code]) do |result|
      result.map do |row|
        fetch_order(code, row["cpf"], row["issue_date"], row["sequence"])
      end.first
    end
  end

  def all
    @connection.query('SELECT * FROM "order"') do |result|
      result.map do |row|
        fetch_order(row["code"], row["cpf"], row["issue_date"], row["sequence"])
      end
    end
  end

  def fetch_order(code, cpf, issue_date, sequence)
    order = Order.new(cpf, Date.parse(issue_date), nil, sequence)

    items = @connection.query('
      SELECT DISTINCT "item".* FROM "order" 
      INNER JOIN "order_item" ON "order_item"."id_order" = "order"."id_order" 
      INNER JOIN "item" ON "order_item"."id_item" = "item"."id_item"
      WHERE "order"."code" = $1', [code]) do |result|
      result.map do |row|
        Item.new(row["id_item"], row["category"], row["description"], row["price"].to_f, row["width"].to_f, row["height"].to_f, row["length"].to_f, row["weight"].to_f)
      end
    end

    @connection.query('
      SELECT DISTINCT "order_item".* FROM "order" 
      INNER JOIN "order_item" ON "order_item"."id_order" = "order"."id_order" 
      WHERE "order"."code" = $1', [code]) do |result|
      result.each do |row|
        item = items.find { |item| item.item_id == row["id_item"]}
        order.add_item(item, row["quantity"].to_f)
      end
    end

    order
  end

  # def orders
  #   orders_data = @connection.query('SELECT * FROM "order"') do |result|
  #     result.map do |row|
  #       row
  #     end.first
  #   end

  #   orders_data.map do |order_data|
      
  #   end
  # end
end