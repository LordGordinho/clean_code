RSpec.describe ValidateCoupon do
  let!(:connection) { PgConnection.instance }
  let!(:coupon_repository) { CouponRepositoryDatabase.new(connection) }
  let!(:validate_coupon) { ValidateCoupon.new(coupon_repository)}

  it 'should validate a coupon' do
    input = {
      "coupon" => 'VALE20',
      "date" => Date.today
    }

    output = validate_coupon.execute(input)

    expect(output["coupon_valid"]).to be_truthy
  end

  it 'should validate a coupon' do
    input = {
      "coupon" => 'VALE30',
    }

    output = validate_coupon.execute(input)

    expect(output["coupon_valid"]).to be_falsey
  end
end