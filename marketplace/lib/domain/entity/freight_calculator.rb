class FreightCalculator
  def calculate(item)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end