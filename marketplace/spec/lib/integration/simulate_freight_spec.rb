RSpec.describe SimulateFreight do
  let!(:connection) { PgConnection.instance }
  let!(:freight_calculator) { DefaultFreightCalculator.new }
  let!(:item_repository) { ItemRepositoryDatabase.new(connection) }
  let!(:simulate_freight) { SimulateFreight.new(item_repository, freight_calculator) }

  it 'should simutat a order freight' do
    input = {
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

    output = simulate_freight.execute(input)
    expect(output["total_freigth"]).to eq 50
  end

  it 'should simutat a order freight' do
    input = {
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
      ]
    }

    output = simulate_freight.execute(input)
    expect(output["total_freigth"]).to eq 260
  end
end