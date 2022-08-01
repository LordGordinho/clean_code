RSpec.describe AllOrders do
  let!(:connection) { PgConnection.instance }
  let!(:order_repository) { OrderRepositoryDatabase.new(connection) }
  let!(:all_orders) { AllOrders.new(order_repository) }
  let!(:item_repository) { ItemRepositoryDatabase.new(connection) }
  let!(:coupon_repository) { CouponRepositoryDatabase.new(connection) }
  let!(:place_order) { PlaceOrder.new(item_repository, order_repository, coupon_repository) }

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
      "date" => "2022-12-10",
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
      "date" => "2022-12-10",
      "coupon" => "VALE20"
    }
    
    place_order.execute(input_2)
  end

  it 'Deve fazer um pedido' do
    input = { }
    output = all_orders.execute(input)
    p output
    expect(output["orders"]).not_to be_nil
  end
end