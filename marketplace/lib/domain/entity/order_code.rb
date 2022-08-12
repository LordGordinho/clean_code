class OrderCode
  attr_reader :value

  def initialize(date = nil, sequence = 1)
    date = date || Date.today
    sequence = sequence || 1
    @value = self.generate_code(date, sequence)
  end

  def generate_code(date = nil, sequence)
    "#{date.strftime("%Y")}#{sprintf('%08d', sequence)}"
  end
end