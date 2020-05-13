require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
  end

  def test_it_exists
    assert_instance_of Potluck, @potluck
  end

  def test_it_has_a_date
    assert_equal "7-13-18", @potluck.date
  end

  def test_it_has_no_dishes_by_default
    assert_empty @potluck.dishes
  end

  def test_dishes_can_be_added
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@cocktail_meatballs)

    assert_equal [@couscous_salad, @cocktail_meatballs], @potluck.dishes
  end
end
