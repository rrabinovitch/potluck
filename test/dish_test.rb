require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test
  def setup
    @dish = Dish.new("Couscous Salad", :appetizer)
  end
  def test_it_exists
    assert_instance_of Dish, @dish
  end
end
