require 'domain/repository/coupon_repository'

class CouponRepositoryDatabase < ItemRepository
  def initialize(connection)
    @connection = connection
  end

  def find_by_code(code)
    coupon_data = @connection.query("select * from coupon where code = $1", [code]) do |result|
      result.map do |row|
        row
      end.first
    end
		return if coupon_data.empty?
		Coupon.new(coupon_data["code"], coupon_data["percentage"].to_i, coupon_data["expire_date"].present? ? Date.parse(coupon_data["expire_date"]) : nil)
  end
end