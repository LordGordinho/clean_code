RSpec.describe ValidateCoupon do
  it 'should validate a coupon' do
    input = {
      coupon: 'VALE20',
      date: Date.today
    }

    coupon_repository = CouponRepositoryMemory.new

    validate_coupon = ValidateCoupon.new(coupon_repository)
    output = validate_coupon.execute(input)

    expect(output[:coupon_valid]).to be_truthy
  end

  it 'should validate a coupon' do
    input = {
      coupon: 'VALE30',
      date: Date.today
    }

    coupon_repository = CouponRepositoryMemory.new

    validate_coupon = ValidateCoupon.new(coupon_repository)
    output = validate_coupon.execute(input)

    expect(output[:coupon_valid]).to be_falsey
  end
end