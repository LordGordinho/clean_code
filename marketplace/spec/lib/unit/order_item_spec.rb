RSpec.describe OrderItem do
  it 'should create item of order' do
    order_item = OrderItem.new(SecureRandom.hex(32), 1000, 3)

    expect(order_item.total_price).to eq 3000
  end
end