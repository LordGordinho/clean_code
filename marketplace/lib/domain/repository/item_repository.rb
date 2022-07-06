class ItemRepository
  def find_by_id(item_id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end