RSpec.describe Item do
  it 'should return size of item' do
    item = Item.new(1, 'Casa', 'Sofa', 3000, nil, 20 , 100)

    expect(item.size).to eq 0
  end

  it 'should return size of item' do
    item = Item.new(1, 'Casa', 'Sofa', 3000, 20, 15 , 10)

    expect(item.size).to eq 0.003
  end

  it 'should return size of item' do
    item = Item.new(1, 'Casa', 'Sofa', 3000, 30, 20 , 100)

    expect(item.size).to eq 0.06
  end

  it "Deve criar um item e calcular o frete" do
    item =  Item.new(1, "Instrumentos Musicais", "Guitarra", 1000, 100, 30, 10, 3)
    freight_calculator = DefaultFreightCalculator.new
    freight = freight_calculator.calculate(item)
    expect(freight).to eq 30
  end
end