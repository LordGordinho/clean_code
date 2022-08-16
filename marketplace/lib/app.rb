require_relative 'infra/http/sinatra_adapter'
require_relative 'infra/http/route_config'
require_relative 'infra/database/pg_connection'
require_relative 'infra/dao/order_dao_database'
require_relative 'infra/dao/item_dao_database'
require_relative 'infra/factory/repository_factory_database'
require_relative 'infra/broker/broker'
require_relative 'application/handler/order_placed_stock_handler'

require 'sinatra'

repository_factory = RepositoryFactoryDatabase.new
connection = PgConnection.instance
order_dao = OrderDaoDatabase.new(connection)
item_dao = ItemDaoDatabase.new(connection)
http = SinatraAdapter.new
broker = Broker.new
order_placed_stock_handler = OrderPlacedStockHandler.new(repository_factory)
broker.register(order_placed_stock_handler)
route_config = RouteConfig.new(http, repository_factory, order_dao, item_dao, broker)

http.run
