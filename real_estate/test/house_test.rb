require 'minitest/autorun'
require 'minitest/pride'
require './real_estate/lib/room'
require './real_estate/lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_has_a_price
    assert_equal 400000, @house.price
  end

  def test_it_has_an_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms
    assert_equal [], @house.rooms
  end

  def test_rooms_can_be_added
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_above_market_average
    assert_equal false, @house.above_market_average?
  end

  def test_room_categories
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_house_details
    expected = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal expected, @house.details
  end

  def price_for_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_rooms_can_be_sorted_by_area
    skip
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  end

  def test_rooms_can_be_sorted_by_category
    skip
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expected = {:bedroom=>[@room_1, @room_2],
                :living_room=> [@room_3],
                :basement=> [@room_4]}

    assert_equal expected, @house.rooms_by_category
  end
end
