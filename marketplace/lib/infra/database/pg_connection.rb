require_relative 'connection'
require 'pg'

class PgConnection
  @instance = PG.connect( dbname: 'ccca' )

  private_class_method :new

  def self.instance
    @instance
  end

  def query(statement)
    @instance.exec(statement)
  end
end