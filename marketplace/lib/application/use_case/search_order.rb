class SearchOrder
  def initialize(repository_order)
    @repository_order = repository_order
  end

  def execute(input)
    order = @repository_order.find_by_code(input["code"])
    return { "order" => order } if order

    { "error" => "Order not found" }
  end
end