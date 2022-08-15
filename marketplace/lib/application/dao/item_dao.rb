class ItemDao
  def all
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end