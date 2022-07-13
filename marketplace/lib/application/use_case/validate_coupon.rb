class ValidateCoupon
  def initialize(coupon_repository)
    @coupon_repository = coupon_repository
  end

  def execute(input)
    coupon = @coupon_repository.find_by_code(input[:coupon])

    return { coupon_valid: false } unless coupon
    
    { coupon_valid: coupon.valid? }
  end
end