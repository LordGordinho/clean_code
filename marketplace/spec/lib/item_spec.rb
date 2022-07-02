RSpec.describe Item do
  it 'should return size of item' do
    item = Item.new('Casa', 'Sofa', 3000, nil, 20 , 100)

    expect(item.size).to eq 0
  end

  it 'should return size of item' do
    item = Item.new('Casa', 'Sofa', 3000, 20, 15 , 10)

    expect(item.size).to eq 0.003
  end

  it 'should return size of item' do
    item = Item.new('Casa', 'Sofa', 3000, 30, 20 , 100)

    expect(item.size).to eq 0.06
  end
end