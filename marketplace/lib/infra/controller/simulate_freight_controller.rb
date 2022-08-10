require_relative '../../application/use_case/simulate_freight'

class SimulateFreightController
  def initialize(repository_factory)
    @repository_factory = repository_factory
  end

  def execute(body, params = {})
    simulate_freight = SimulateFreight.new(@repository_factory) 
    output = simulate_freight.execute(body)
  
    output.to_json
  end
end