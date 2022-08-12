RSpec.describe SearchOrders do
  let!(:connection) { PgConnection.instance }
  let!(:order_repository) { OrderRepositoryDatabase.new(connection) }
  let!(:repository_factory_database) { RepositoryFactoryDatabase.new }
  let!(:place_order) { PlaceOrder.new(repository_factory_database) }
  let!(:search_order) { SearchOrders.new(order_repository) }

  before(:each) do
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
      "date" => Date.parse("2022-12-10"),
      "coupon" => "VALE20"
    }

    place_order.execute(input)

    input_2 = {
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
      "date" => Date.parse("2022-12-10"),
      "coupon" => "VALE20"
    }
    
    place_order.execute(input_2)
  end

  it 'Deve fazer um pedido' do
    input = {
      "code" => '202200000001'
    }

    output = search_order.execute(input)
    p output
    expect(output["order"]).not_to be_nil
  end

  it 'Deve fazer um pedido' do
    input = {
      "code" => 'XXXXXXXXX'
    }

    output = search_order.execute(input)
    p output
    expect(output["error"]).not_to be_nil
  end
end