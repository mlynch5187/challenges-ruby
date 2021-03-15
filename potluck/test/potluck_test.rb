require 'minitest/autorun'
require 'minitest/pride'
require './potluck/lib/dish'
require './potluck/lib/potluck'

class PotluckTest < Minitest::Test
  def setup
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)
  end

  def test_it_has_a_date
    assert_equal "7-13-18", @potluck.date
  end

  def test_it_has_dishes
    assert_equal [], @potluck.dishes
  end

  def test_it_has_dishes
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@cocktail_meatballs)

    assert_equal [@couscous_salad, @cocktail_meatballs], @potluck.dishes
    assert_equal 2, @potluck.dishes.length
  end

  def test_it_can_get_all_dishes_from_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)

    assert_equal [@couscous_salad, @summer_pizza], @potluck.get_all_from_category(:appetizer)
  end

  def test_it_can_get_first_dish_from_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)

    assert_equal @couscous_salad, @potluck.get_all_from_category(:appetizer).first
  end

  def test_it_can_get_name_of_first_dish_from_category
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)

    assert_equal "Couscous Salad", @potluck.get_all_from_category(:appetizer).first.name
  end

  def test_it_can_get_menu_organized_by_category
    skip
    @potluck.add_dish(@bean_dip)
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)

    expected = {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
                :entres=>["Cocktail Meatballs", "Roast Pork"],
                :desserts=>["Candy Salad"]}

    assert_equal expected, @potluck.menu
  end

  def test_it_can_calculate_ratio_of_category
    skip
    @potluck.add_dish(@bean_dip)
    @potluck.add_dish(@couscous_salad)
    @potluck.add_dish(@summer_pizza)
    @potluck.add_dish(@roast_pork)
    @potluck.add_dish(@cocktail_meatballs)
    @potluck.add_dish(@candy_salad)

    assert_equal 50.0, @potluck.ratio(:appetizer)
  end
end
