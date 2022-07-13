class ValidateCoupon
  def initialize(coupon_repository)
    @coupon_repository = coupon_repository
  end

  def execute(input)
    coupon = @coupon_repository.find_by_code(input[:coupon])
    
    {
      coupon_valid: coupon_valid?(coupon, input[:date])
    }
  end

  private 
  
  def coupon_valid?(coupon, date)
    !coupon.expired?(date)
  end
end