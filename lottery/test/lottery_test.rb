require 'minitest/autorun'
require "./lottery/lib/contestant"
require "./lottery/lib/game"
require "./lottery/lib/lottery"

class LotteryTest < Minitest::Test
  def setup
    @lottery = Lottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
                           first_name: 'Alexander',
                           last_name: 'Aigades',
                           age: 28,
                           state_of_residence: 'CO',
                           spending_money: 10})
    @benjamin = Contestant.new({
                           first_name: 'Benjamin',
                           last_name: 'Franklin',
                           age: 17,
                           state_of_residence: 'PA',
                           spending_money: 100})
    @frederick = Contestant.new({
                           first_name:  'Frederick',
                           last_name: 'Douglas',
                           age: 55,
                           state_of_residence: 'NY',
                           spending_money: 20})
    @winston = Contestant.new({
                         first_name: 'Winston',
                         last_name: 'Churchill',
                         age: 18,
                         state_of_residence: 'CO',
                         spending_money: 5})
    @grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})
  end

  def test_it_exists
    assert_instance_of Lottery, @lottery
  end

  def test_lottery_winners
    assert_equal [], @lottery.winners
  end

  def test_registered_contestants
  end

  def test_current_contestants
    assert_equal ({}), @lottery.current_contestants
  end

  def test_interested_and_18
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
    assert_equal true, @lottery.interested_and_18?(@alexander, @pick_4)
    assert_equal false, @lottery.interested_and_18?(@benjamin, @mega_millions)
    assert_equal false, @lottery.interested_and_18?(@alexander, @cash_5)
  end

  def test_can_register
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
    assert_equal true, @lottery.can_register?(@alexander, @pick_4)
    assert_equal false, @lottery.can_register?(@alexander, @cash_5)
    assert_equal true, @lottery.can_register?(@frederick, @mega_millions)
    assert_equal false, @lottery.can_register?(@benjamin, @mega_millions)
    assert_equal false, @lottery.can_register?(@frederick, @cash_5)
  end

  def test_registered_contestants
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
    assert_equal ({}), @lottery.registered_contestants

    @lottery.register_contestant(@alexander, @pick_4)
    assert_equal ({"Pick 4"=> [@alexander]}), @lottery.registered_contestants

    @lottery.register_contestant(@alexander, @mega_millions)
    assert_equal ({"Pick 4"=> [@alexander], "Mega Millions"=> [@alexander]}), @lottery.registered_contestants

    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)
    assert_equal ({"Pick 4"=> [@alexander], "Mega Millions" => [@alexander, @frederick, @winston], "Cash 5" => [@winston]}), @lottery.registered_contestants

    @grace.add_game_interest('Mega Millions')
    @grace.add_game_interest('Cash 5')
    @grace.add_game_interest('Pick 4')
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)

    assert_equal ({"Pick 4"=> [@alexander, @grace], "Mega Millions" => [@alexander, @frederick, @winston, @grace], "Cash 5" => [@winston, @grace]}), @lottery.registered_contestants
  end

  def test_eligible_contestants
    skip
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')

    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)

    @grace.add_game_interest('Mega Millions')
    @grace.add_game_interest('Cash 5')
    @grace.add_game_interest('Pick 4')
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)

    assert_equal [@alexander, @grace], @lottery.eligible_contestants(@pick_4)
    assert_equal [@winston, @grace], @lottery.eligible_contestants(@cash_5)
    assert_equal [@alexander, @frederick, @winston, @grace], @lottery.eligible_contestants(@mega_millions)
  end

  def test_charge_contestants
    skip
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')

    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
    @lottery.register_contestant(@winston, @mega_millions)

    @grace.add_game_interest('Mega Millions')
    @grace.add_game_interest('Cash 5')
    @grace.add_game_interest('Pick 4')
    @lottery.register_contestant(@grace, @mega_millions)
    @lottery.register_contestant(@grace, @cash_5)
    @lottery.register_contestant(@grace, @pick_4)

    @lottery.charge_contestants(@cash_5)

    expected_1 = ({@cash_5 => ["Winston Churchill", "Grace Hopper"]})

    assert_equal expected_1, @lottery.current_contestants
    assert_equal 19, @grace.spending_money
    assert_equal 4, @winston.spending_money

    @lottery.charge_contestants(@mega_millions)

    expected_2 = ({@cash_5 => ["Winston Churchill", "Grace Hopper"], @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"]})

    assert_equal expected_2, @lottery.current_contestants
    assert_equal 14, @grace.spending_money
    assert_equal 4, @winston.spending_money
    assert_equal 5, @alexander.spending_money
    assert_equal 15, @frederick.spending_money

    @lottery.charge_contestants(@pick_4)

    expected_3 = ({@cash_5 => ["Winston Churchill", "Grace Hopper"], @mega_millions => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"], @pick_4 => ["Alexander Aigades", "Grace Hopper"]})

    assert_equal expected_3, @lottery.current_contestants
  end
end
