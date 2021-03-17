require 'minitest/autorun'
require 'minitest/pride'
require './tv_network/lib/character'
require './tv_network/lib/show'

class ShowTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_test_it_exists
    assert_instance_of Show, @knight_rider
  end

  def test_it_has_a_name
    assert_equal @knight_rider.name, "Knight Rider"
  end

  def test_it_has_a_creator
    assert_equal @knight_rider.creator, "Glen Larson"
  end

  def test_it_has_characters
    assert_equal @knight_rider.characters, [@kitt, @michael_knight]
  end

  def test_total_salary
    assert_equal @michael_knight, 260000
  end

  def test_highest_paid_actor
    assert_equal "David Hasselhoff", @knight_rider.highest_paid_actor
  end

  def test_it_has_actors
    assert_equal ["David Hasselhoff", "William Daniels"], @knight_rider.actors
  end
end
