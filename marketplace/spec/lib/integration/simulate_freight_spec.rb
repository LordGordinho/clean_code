RSpec.describe SimulateFreight do
  it 'should simutat a order freight' do
    input = {
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

    item_repository = ItemRepositoryMemory.new
    freight_calculator = DefaultFreightCalculator.new

    simulate_freight =  SimulateFreight.new(item_repository, freight_calculator)
    output = simulate_freight.execute(input)

    expect(output[:total_freigth]).to eq 0
  end

  it 'should simutat a order freight' do
    input = {
      order_items: [
          {
              id_item: 4,
              quantity: 1
          },
          {
              id_item: 5,
              quantity: 1
          },
          {
              id_item: 6,
              quantity: 3
          }
      ]
    }

    item_repository = ItemRepositoryMemory.new
    freight_calculator = DefaultFreightCalculator.new

    simulate_freight =  SimulateFreight.new(item_repository, freight_calculator)
    output = simulate_freight.execute(input)

    expect(output[:total_freigth]).to eq 260
  end
end