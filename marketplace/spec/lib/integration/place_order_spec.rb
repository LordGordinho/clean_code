RSpec.describe PlaceOrder do
  it 'Deve fazer um pedido' do
    input = {
        cpf: "847.903.332-05",
        order_items: [
            {
                id_item: 1,
                quantity: 1
            },
            {
                id_item: 2,
                quantity: 1
            },
            {
                id_item: 3,
                quantity: 3
            }
        ],
        date: Date.parse("2021-12-10"),
        coupon: "VALE20"
    }

    place_order =  PlaceOrder.new(ItemRepositoryMemory.new , OrderRepositoryMemory.new, CouponRepositoryMemory.new)
    output = place_order.execute(input)
    expect(output[:total]).to eq 6090 - 6090 * 0.2
  end

  it 'Deve fazer um pedido' do
    input = {
        cpf: "847.903.332-05",
        order_items: [
            {
                id_item: 1,
                quantity: 1
            },
            {
                id_item: 2,
                quantity: 1
            },
            {
                id_item: 3,
                quantity: 3
            }
        ]
    }
    
    order_repository = OrderRepositoryMemory.new
    item_repository = ItemRepositoryMemory.new
    coupon_repository = CouponRepositoryMemory.new
    place_order =  PlaceOrder.new(item_repository, order_repository, coupon_repository)
    output = place_order.execute(input)
    expect(order_repository.orders.count).to eq 1
  end
end