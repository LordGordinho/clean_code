class OrderDao
  def find_by_code(code)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def all
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end