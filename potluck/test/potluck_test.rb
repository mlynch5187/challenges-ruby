require 'minitest/autorun'
require 'minitest/pride'
require './potluck/lib/dish'
require './potluck/lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @dish = Dish.new("Couscous Salad", :appetizer)
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
  end

  def test_it_has_a_date
    skip
    assert_equal "7-13-18", @potluck.date
  end

  def test_it_has_dishes
    skip
    assert_equal [], @potluck.dishes
  end

  def test_it_has_dishes
    skip
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(cocktail_meatballs)

    assert_equal [@couscous_salad, @cocktail_meatballs], @potluck.dishes
    assert_equal 2, @potluck.dishes.length
  end
end
