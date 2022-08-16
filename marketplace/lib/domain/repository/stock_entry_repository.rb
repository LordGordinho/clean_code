class StockEntryRepository
  def save(order)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def find_by_id_item(id_item)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def clear
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end