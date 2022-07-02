RSpec.describe Order do
  context 'order valid' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with zero item' do
      expect(order.total_price).to eq 0
    end

    it 'should create order with three item' do
      order.add_item(Item.new('Casa', 'Sofa', 3000), 2)

      expect(order.total_price).to eq 6000
    end

    it 'should create order with three item' do
      order.add_item(Item.new('Casa', 'Sofa', 3000), 1)
      order.add_item(Item.new('Casa', 'Tv', 2000), 1)
      order.add_item(Item.new('Casa', 'Geladeira', 4000), 1)
      order.add_coupon(Coupon.new('VALE20', 20))

      expect(order.total_price).to eq 9000 * 0.8
    end
  end

  context 'with coupon expired' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with three item without discount' do
      order.add_item(Item.new('Casa', 'Sofa', 3000), 1)
      order.add_item(Item.new('Casa', 'Tv', 2000), 1)
      order.add_item(Item.new('Casa', 'Geladeira', 4000), 1)
      order.add_coupon(Coupon.new('VALE20', 20, '2021-01-01'))

      expect(order.total_price).to eq 9000
    end
  end

  context 'with shipping calculation' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with three item without discount' do
      order.add_item(Item.new('Casa', 'Sofa', 3000, 10, 10, 10), 1)
      order.add_item(Item.new('Casa', 'Tv', 2000, 10, 10, 10), 1)
      order.add_item(Item.new('Casa', 'Geladeira', 4000, 10, 10, 10), 1)
      order.add_coupon(Coupon.new('VALE20', 20, '2021-01-01'))

      expect(order.total_price).to eq 9000
    end

    it 'should create order with three item without discount' do
      order.add_item(Item.new('Casa', 'Camera', 3000, 20, 15, 10, 333), 1)
      order.add_item(Item.new('Casa', 'Guitarra', 2000, 100, 30, 10, 100), 1)
      order.add_item(Item.new('Casa', 'Geladeira', 4000, 200, 100, 50, 40), 1)
      order.add_coupon(Coupon.new('VALE20', 20, '2021-01-01'))

      expect(order.total_price).to eq 9440
    end

    it 'should create order with three item without discount' do
      order.add_item(Item.new('Casa', 'Camera', 3000, 20, 15, 10, 333), 2)
      order.add_item(Item.new('Casa', 'Guitarra', 2000, 100, 30, 10, 100), 1)
      order.add_item(Item.new('Casa', 'Geladeira', 4000, 200, 100, 50, 40), 1)
      order.add_coupon(Coupon.new('VALE20', 20, '2021-01-01'))

      expect(order.total_price).to eq 12449.98
    end
  end

  it 'should not create order with document invalid' do
    expect{ Order.new('111.111.111-11')}.to raise_error("Document Invalid")
  end
end
