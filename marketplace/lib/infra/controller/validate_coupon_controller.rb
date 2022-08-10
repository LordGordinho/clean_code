require_relative '../../application/use_case/validate_coupon'

class ValidateCouponController
  def initialize(repository_factory)
    @repository_factory = repository_factory
  end

  def execute(body, params = {})
    validate_coupon = ValidateCoupon.new(@repository_factory) 
    output = validate_coupon.execute(body)
  
    output.to_json
  end
end