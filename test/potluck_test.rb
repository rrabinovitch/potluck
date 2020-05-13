require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @basic_potluck = Potluck.new("7-13-18")
    @full_potluck = Potluck.new("7-13-18")
    @fuller_potluck = Potluck.new("7-13-18")

    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)

    @full_potluck.add_dish(@couscous_salad)
    @full_potluck.add_dish(@summer_pizza)
    @full_potluck.add_dish(@roast_pork)
    @full_potluck.add_dish(@cocktail_meatballs)
    @full_potluck.add_dish(@candy_salad)

    @fuller_potluck.add_dish(@couscous_salad)
    @fuller_potluck.add_dish(@summer_pizza)
    @fuller_potluck.add_dish(@roast_pork)
    @fuller_potluck.add_dish(@cocktail_meatballs)
    @fuller_potluck.add_dish(@candy_salad)
    @fuller_potluck.add_dish(@bean_dip)
  end

  def test_it_exists
    assert_instance_of Potluck, @basic_potluck
  end

  def test_it_has_a_date
    assert_equal "7-13-18", @basic_potluck.date
  end

  def test_it_has_no_dishes_by_default
    assert_empty @basic_potluck.dishes
  end

  def test_dishes_can_be_added
    @basic_potluck.add_dish(@couscous_salad)
    @basic_potluck.add_dish(@cocktail_meatballs)

    assert_equal [@couscous_salad, @cocktail_meatballs], @basic_potluck.dishes
  end

  def test_it_can_identify_meals_of_each_category
    assert_equal [@couscous_salad, @summer_pizza], @full_potluck.get_all_from_category(:appetizer)
    assert_equal @couscous_salad, @full_potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", @full_potluck.get_all_from_category(:appetizer).first.name

    assert_equal [@roast_pork, @cocktail_meatballs], @full_potluck.get_all_from_category(:entre)
    assert_equal [@candy_salad], @full_potluck.get_all_from_category(:dessert)
  end

  def test_it_can_list_menu
    menu = {
      :appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
      :entres=>["Cocktail Meatballs", "Roast Pork"],
      :desserts=>["Candy Salad"]
    }
    
    assert_equal menu, @fuller_potluck.menu
  end

  def test_it_can_identify_ratio_of_items_in_each_category_to_full_menu
    skip
  end
end
