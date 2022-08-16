class handler
  attr_reader :name

  def handler(event)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end