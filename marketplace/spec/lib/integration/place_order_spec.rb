RSpec.describe PlaceOrder do
  it 'Deve fazer um pedido' do
    input = {
        cpf: "847.903.332-05",
        orderItems: [
            {
                idItem: 1,
                quantity: 1
            },
            {
                idItem: 2,
                quantity: 1
            },
            {
                idItem: 3,
                quantity: 3
            }
        ]
    }

    place_order =  PlaceOrder.new(ItemRepositoryMemory.new , OrderRepositoryMemory.new)
    output = place_order.execute(input)
    expect(output.total).to eq 6090
  end
end