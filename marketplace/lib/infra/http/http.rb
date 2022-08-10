class Http
  def on
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def run
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end