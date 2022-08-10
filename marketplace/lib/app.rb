require_relative 'infra/http/sinatra_adapter'
require_relative 'infra/http/route_config'
require_relative 'infra/factory/repository_factory_database'

require 'sinatra'

repository_factory = RepositoryFactory.new
http = SinatraAdapter.new
route_config = RouteConfig.new(http, repository_factory)
http.run
