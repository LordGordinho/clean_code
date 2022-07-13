class OrderCode
  attr_reader :value

  def initialize(date = Date.today, sequence = 1)
    @value = self.generate_code(date, sequence)
  end

  def generate_code(date = Date.today, sequence)
    "#{date.strftime("%Y")}#{sprintf('%08d', sequence)}"
  end
end