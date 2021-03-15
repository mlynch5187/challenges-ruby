require 'minitest/autorun'
require 'minitest/pride'
require './potluck/lib/dish'
require './potluck/lib/potluck'


class PotluckTest < Minitest::Test

  def setup
    @dish = Dish.new("Couscous Salad", :appetizer)
  end

  def test_it_exists
    assert_instance_of Dish, @dish
  end

  def test_it_has_a_name
    skip
    assert_equal "Couscous Salad", @dish.name
  end

  def test_it_has_a_category
    skip
    assert_equal :appetizer, @dish.category
  end
end
