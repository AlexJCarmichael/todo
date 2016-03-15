
class ListManager
  attr_accessor :list, :completed
  def initialize(list, completed, item = nil)
    @list = list
    @completed = completed
    @item = item
  end

  def add_item(item)
    @list.push(item)
  end
end
