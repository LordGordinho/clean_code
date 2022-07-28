class ValidateCoupon
  def initialize(coupon_repository)
    @coupon_repository = coupon_repository
  end

  def execute(input)
    coupon = @coupon_repository.find_by_code(input["coupon"])
    date_verification = input["date"].nil? ? Date.today : Date.parse(input["date"])

    return { "coupon_valid" => false } unless coupon
    
    { "coupon_valid" => coupon.valid?(date_verification) }
  end
end