RSpec.describe Shipping do
  it 'should return price of shipping' do
    item = Item.new('Casa', 'Sofa', 3000, 100, 30, 10, 100)

    shipping = Shipping.new(item, 1000)

    expect(shipping.price).to eq 30
  end

  it 'should return price of shipping' do
    item = Item.new('Casa', 'Sofa', 3000, 200, 100, 50, 40)

    shipping = Shipping.new(item, 1000)

    expect(shipping.price).to eq 400
  end

  it 'should return price of shipping' do
    item = Item.new('Casa', 'Sofa', 3000, 100, 30, 10, 100)

    shipping = Shipping.new(item, 100)

    expect(shipping.price).to eq 10
  end
end