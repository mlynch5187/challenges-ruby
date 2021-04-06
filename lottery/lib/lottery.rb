class Lottery
  attr_reader :winners, :registered_contestants, :current_contestants
  def initialize()
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    if contestant.game_interests.include?("#{game.name}") && contestant.age >= 18
      true
    else
      false
    end
  end
end
