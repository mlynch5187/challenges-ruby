require 'minitest/autorun'
require './market/lib/item'
require './market/lib/vendor'

class MarketTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_a_name
    assert_equal "Tomato", @item2.name
  end

  def test_it_has_a_price
    assert_equal 0.50, @item2.price
  end
end
