require 'sinatra'
require 'json'

before do
  content_type :json
end

class AppMarketplace < Sinatra::Application
  Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |lib| require lib }
end