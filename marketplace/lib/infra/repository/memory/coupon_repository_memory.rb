require 'domain/repository/coupon_repository'

class CouponRepositoryMemory < ItemRepository
  def initialize
    @coupons = [
      Coupon.new("VALE20", 20, nil),
    ]
  end

  def find_by_code(code)
    @coupons.find { |coupon| coupon.code === code }
  end
end