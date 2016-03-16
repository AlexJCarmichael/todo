require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list_manager.rb'

class ListManagerTest < Minitest::Test
  def setup
    list = ["Bob", "Jerry", "Gus", "Burnie"]
    completed = []
    @listman = ListManager.new(list, completed)
  end

  def test_add_item
    @listman.add_item("Reggie")
    @listman.add_item(9)
    @listman.add_item("Gav")
    assert_equal(["Bob", "Jerry", "Gus", "Burnie", "Reggie", 9, "Gav"], @listman.list)
  end
end
