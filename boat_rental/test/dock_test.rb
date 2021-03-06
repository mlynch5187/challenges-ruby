require 'minitest/autorun'
require './boat_rental/lib/boat'
require './boat_rental/lib/dock'
require './boat_rental/lib/renter'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_has_a_name
    assert_equal "The Rowing Dock", @dock.name
  end

  def test_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_has_a_rental_log
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    expected = {
                  @kayak_1 => @patrick,
                  @kayak_2 => @patrick,
                  @sup_1 => @eugene
                }

    assert_equal expected, @dock.rental_log
  end

  def test_it_can_be_charged
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    @kayak_1.add_hour
    @kayak_1.add_hour
    expected = {
                :card_number => "4242424242424242",
                :amount => 40
                }

    assert_equal expected, @dock.charge(@kayak_1)
  end

  def test_hours_past_max_rental_time
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    expected = {
                :card_number => "1313131313131313",
                :amount => 45
                }

    assert_equal expected, @dock.charge(@sup_1)
  end
end
