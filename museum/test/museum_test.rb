require 'minitest/autorun'
require './museum/lib/exhibit'
require './museum/lib/patron'
require './museum/lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_has_exhibits
    assert_equal [], @dmns.exhibits
  end

  def test_exhibits_can_be_added
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_has_recommended_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@patron_1)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)
  end

  def test_patrons_can_be_admitted
    assert_equal [], @dmns.patrons

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    assert_equal [@patron_1, @patron_2, @patron_3], @dmns.patrons
  end

  def test_patrons_by_exhibit_interest
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expected = {
      @gems_and_minerals => [@patron_1],
      @dead_sea_scrolls => [@patron_1, @patron_3],
      @imax => [@patron_2]
    }

    assert_equal expected, @dmns.patrons_by_exhibit_interest
  end

  def test_ticket_lottery_contestants
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    assert_equal [@patron_1, @patron_3], @dmns.ticket_lottery_contestants(@dead_sea_scrolls)
  end

  def test_draw_lottery_winner
    Patron.stub(:name, "Johnny") do
      patron_1 = Patron.new("Johnny", 20)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_2 = Patron.new("Bob", 20)
      patron_2.add_interest("Dead Sea Scrolls")
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @dmns.admit(patron_1)
      @dmns.admit(patron_2)

    assert_equal patron_1, @dmns.draw_lottery_winner(@dead_sea_scrolls)
    end
  end
end

# pry(main)> dmns.draw_lottery_winner(dead_sea_scrolls)
# # => "Johnny" or "Bob" can be returned here. Fun!
#
# pry(main)> dmns.draw_lottery_winner(gems_and_minerals)
# # => nil
#
# #If no contestants are elgible for the lottery, nil is returned.
#
# pry(main)> dmns.announce_lottery_winner(dead_sea_scrolls)
# # => "Bob has won the Dead Sea Scrolls exhibit lottery"
#
# # The above string should match exactly, you will need to stub the return of `draw_lottery_winner` as the above method should depend on the return value of `draw_lottery_winner`.
#
# pry(main)> dmns.announce_lottery_winner(gems_and_minerals)
# # => "No winners for this lottery"
#
# # If there are no contestants, there are no winners.
# ```
