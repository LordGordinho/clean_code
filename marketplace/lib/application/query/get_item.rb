class GetItem
  def initialize(item_dao)
    @item_dao = item_dao
  end

  def execute
    @item_dao.all
  end
end