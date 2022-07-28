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