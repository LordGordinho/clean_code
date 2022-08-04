require_relative '../../domain/factory/repository_factory'
require_relative '../repository/database/coupon_repository_database'
require_relative '../repository/database/item_repository_database'
require_relative '../repository/database/order_repository_database'

class RepositoryFactoryDatabase < RepositoryFactory
  def create_coupon_repository
    CouponRepositoryDatabase.new(PgConnection.instance)
  end

  def create_item_repository
    ItemRepositoryDatabase.new(PgConnection.instance)
  end

  def create_order_repository
    OrderRepositoryDatabase.new(PgConnection.instance)
  end
end