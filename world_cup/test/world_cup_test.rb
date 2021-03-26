require 'minitest/autorun'
require './world_cup/lib/player'
require './world_cup/lib/team'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @croatia = Team.new("Croatia")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_a_year
    assert_equal 2018, @world_cup.year
  end

  def test_it_has_teams
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_it_has_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")

    @croatia.eliminated = true

    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end
end
