RSpec.describe "GetStock" do
  let!(:repository_factory) { RepositoryFactoryDatabase.new }
  let!(:stock_entry_repository) { repository_factory.create_stock_entry_repository }
  let!(:save_stock) { SaveStock.new(repository_factory) }
  let!(:get_stock) { GetStock.new(repository_factory) }

  before(:each) do
    stock_entry_repository.clear
  end

  it 'shloud return stock' do
    save_stock_inputa = {
      "id_item" => 1,
      "operation" => "in",
      "quantity" => 10,
      "date" => "2022-01-01"
    }
    save_stock.execute(save_stock_inputa)

    save_stock_inputb = {
      "id_item" => 1,
      "operation" => "out",
      "quantity" => 5,
      "date" => "2022-01-01"
    }
    save_stock.execute(save_stock_inputb)

    total = get_stock.execute(1)

    expect(total).to eq 5
  end
end