class StockCalculator
  def calculate(stock_entries)
    total = 0

    stock_entries.each do |stock_entry|
      total += stock_entry.quantity if stock_entry.operation === 'in'
      total -= stock_entry.quantity if stock_entry.operation === 'out'
    end

    total
  end 
end