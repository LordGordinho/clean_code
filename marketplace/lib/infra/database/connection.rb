class Connection
  def query(statement, params = [])
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'" 
  end
end