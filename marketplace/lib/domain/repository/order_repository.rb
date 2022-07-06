class OrderRepository
  def save(order)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end