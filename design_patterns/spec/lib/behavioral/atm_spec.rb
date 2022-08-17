RSpec.describe Atm do
  let!(:handler1) { BillHandler.new(nil, 1) } 
  let!(:handler5) { BillHandler.new(handler1, 5) } 
  let!(:handler10) { BillHandler.new(handler5, 10) } 
  let!(:handler20) { BillHandler.new(handler10, 20) } 
  let!(:handler50) { BillHandler.new(handler20, 50) } 
  let!(:handler100) { BillHandler.new(handler50, 100) } 

  it 'should drop money' do
    atm = Atm.new handler100
    bills = atm.withdraw(978)

    expect(bills).to match_array [
      { type: 100, quantity: 9 },
      { type: 50, quantity: 1 },
      { type: 20, quantity: 1 },
      { type: 10, quantity: 0 },
      { type: 5, quantity: 1 },
      { type: 1, quantity: 3 }
    ]
  end
end