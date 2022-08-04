class RepositoryFactory
  def create_coupon_repository
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_item_repository
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_order_repository
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end