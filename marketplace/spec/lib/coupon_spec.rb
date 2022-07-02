RSpec.describe Coupon do
  it 'shold return an expired coupon' do
    coupon = Coupon.new('OFF10', 10, '2022-01-12')

    expect(coupon.expired?).to be_truthy
  end

  it 'shold return an expired coupon' do
    coupon = Coupon.new('OFF10', 10)

    expect(coupon.expired?).to be_falsy
  end

  it 'shold return an expired coupon' do
    coupon = Coupon.new('OFF10', 10, '2022-12-12')

    expect(coupon.expired?).to be_falsy
  end

  it 'shold calculate discount' do
    coupon = Coupon.new('OFF10', 10, '2022-12-12')

    expect(coupon.calculate_discount(100)).to eq 10
  end
end