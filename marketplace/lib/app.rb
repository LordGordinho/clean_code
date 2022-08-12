require_relative 'infra/http/sinatra_adapter'
require_relative 'infra/http/route_config'
require_relative 'infra/database/pg_connection'
require_relative 'infra/dao/order_dao_database'
require_relative 'infra/factory/repository_factory_database'

require 'sinatra'

repository_factory = RepositoryFactoryDatabase.new
connection = PgConnection.instance
order_dao = OrderDaoDatabase.new(connection)
http = SinatraAdapter.new
route_config = RouteConfig.new(http, repository_factory, order_dao)

http.run
