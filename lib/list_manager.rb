
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

  def remove_item(item)
    new_item = @list[item-1]
    @completed.push(new_item)
    @list.delete_at(item-1)
  end
end
