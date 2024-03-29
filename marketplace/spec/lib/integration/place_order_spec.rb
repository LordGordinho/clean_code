RSpec.describe PlaceOrder do
  let!(:connection) { PgConnection.instance }
  let!(:order_repository) { OrderRepositoryDatabase.new(connection) }
  let!(:repository_factory_database) { RepositoryFactoryDatabase.new }
  let!(:place_order) { PlaceOrder.new(repository_factory_database) }

  it 'Deve fazer um pedido' do
    input = {
        "cpf" => "847.903.332-05",
        "order_items" => [
            {
                "id_item" => 1,
                "quantity" => 1
            },
            {
                "id_item" => 2,
                "quantity" => 1
            },
            {
                "id_item" => 3, 
                "quantity" => 3
            }
        ],
        "date" => Date.parse("2021-12-10"),
        "coupon" => "VALE20"
    }

    output = place_order.execute(input)
    expect(output["total"]).to eq 138
  end

  it 'Deve fazer um pedido' do
    input = {
        "cpf" => "847.903.332-05",
        "order_items" => [
            {
                "id_item" => 4,
                "quantity" => 1
            },
            {
                "id_item" => 5,
                "quantity" => 1
            },
            {
                "id_item" => 6,
                "quantity" => 3
            }
        ],
        "date" => Date.parse("2021-12-10")
    }

    output = place_order.execute(input)
    expect(output["total"]).to eq 6350
  end

  it 'Deve fazer um pedido' do
    input = {
        "cpf" => "847.903.332-05",
        "order_items" => [
            {
                "id_item" => 1,
                "quantity" => 1
            },
            {
                "id_item" => 2,
                "quantity" => 1
            },
            {
                "id_item" => 3,
                "quantity" => 3
            }
        ]
    }

    output = place_order.execute(input)
    expect(order_repository.count).to eq 1
  end
end