require 'minitest/autorun'
require 'minitest/pride'
require './real_estate/lib/room'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, "13")
  end

  def test_room_exists
    assert_instance_of Room, @room
  end

  def test_room_has_a_category
    assert_equal :bedroom, @room.category
  end

  def test_room_has_an_area
    assert_equal 130, @room.area
  end

  def test_room_can_be_painted
    skip
    assert_equal false, @room.is_painted?

    @room.paint

    assert_equal true, @room.is_painted?
  end
end
