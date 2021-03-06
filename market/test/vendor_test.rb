require 'minitest/autorun'
require './market/lib/item'
require './market/lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_has_inventory
    assert_equal ({}), @vendor.inventory
  end

  def test_stock_can_be_checked
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_vendors_can_check_stocks
    assert_equal 0, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 30)

    assert_equal ({@item1 => 30}), @vendor.inventory
    assert_equal 30, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 25)

    assert_equal 55, @vendor.check_stock(@item1)

    @vendor.stock(@item2, 12)

    assert_equal ({@item1 => 55, @item2 => 12}), @vendor.inventory
  end
end
