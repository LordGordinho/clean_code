RSpec.describe Order do
  context 'order valid' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with zero item' do
      expect(order.total_price).to eq 0
    end

    it 'should create order with three item' do
      order.add_item(Item.new(1, 'Casa', 'Sofa', 3000), 2)

      expect(order.total_price).to eq 6000
    end

    it 'should create order with three item' do
      order.add_item(Item.new(1, 'Casa', 'Sofa', 3000), 1)
      order.add_item(Item.new(2, 'Casa', 'Tv', 2000), 1)
      order.add_item(Item.new(3, 'Casa', 'Geladeira', 4000), 1)
      order.add_coupon(Coupon.new('VALE20', 20))

      expect(order.total_price).to eq 9000 * 0.8
    end
  end

  context 'with coupon expired' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with three item without discount' do
      order.add_item(Item.new(1, 'Casa', 'Sofa', 3000), 1)
      order.add_item(Item.new(2, 'Casa', 'Tv', 2000), 1)
      order.add_item(Item.new(3, 'Casa', 'Geladeira', 4000), 1)
      order.add_coupon(Coupon.new('VALE20', 20, (Date.today - 1)))

      expect(order.total_price).to eq 9000
    end
  end

  context 'with shipping calculation' do
    let!(:order) { Order.new('573.220.250-16') }

    it 'should create order with three item without discount' do
      order.add_item(Item.new(1, 'Casa', 'Amplificador', 3000, 100, 30, 10, 3), 1)
      order.add_item(Item.new(2, 'Casa', 'Guitarra', 5000, 100, 50, 50, 20), 1)
      order.add_item(Item.new(3, 'Casa', 'cabo', 4000, 10, 10, 10, 0.9), 3)

      expect(order.freight).to eq 260
    end
  end

  it 'should not create order with document invalid' do
    expect{ Order.new('111.111.111-11')}.to raise_error("Document Invalid")
  end

  it 'should generate a code for order' do
    order_1 = Order.new('573.220.250-16')
    order_2 = Order.new('573.220.250-16')
    order_3 = Order.new('573.220.250-16')

    order_repository_memory = OrderRepositoryMemory.new

    order_repository_memory.save(order_1)
    order_repository_memory.save(order_2)
    order_repository_memory.save(order_3)

    expect(order_1.code).to eq "202200000001"
  end

  it 'should generate a code for order' do
    order_1 = Order.new('573.220.250-16')
    order_2 = Order.new('573.220.250-16')
    order_3 = Order.new('573.220.250-16')

    order_repository_memory = OrderRepositoryMemory.new

    order_repository_memory.save(order_1)
    order_repository_memory.save(order_2)
    order_repository_memory.save(order_3)

    expect(order_3.code).to eq "202200000003"
  end

  it 'should generate a code for order' do
    order_1 = Order.new('573.220.250-16')
    order_2 = Order.new('573.220.250-16')
    order_3 = Order.new('573.220.250-16')

    order_repository_memory = OrderRepositoryMemory.new

    order_repository_memory.save(order_1)
    order_repository_memory.save(order_2)
    order_repository_memory.save(order_3)

    expect(order_2.code).to eq "202200000002"
  end
end
