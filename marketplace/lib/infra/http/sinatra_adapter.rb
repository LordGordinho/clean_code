require 'sinatra/base'
require_relative 'http'

class SinatraAdapter < Http
  attr_reader :routes_config
  def initialize
    @routes_config = []
  end

  def on(url, method, &function)
    @routes_config << {
      url: url,
      method: method,
      function: function
    }
  end
  
  def run
    routes_config = @routes_config
    
    @app = Sinatra.new do
      routes_config.map do |route|
        Sinatra::Base.send(route[:method], route[:url], &route[:function]) 
      end
    end

    run @app.run!
  end
end
