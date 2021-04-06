class Lottery
  attr_reader :winners, :registered_contestants, :current_contestants
  def initialize()
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    if contestant.game_interests.include?(game.name) && contestant.age >= 18
      true
    else
      false
    end
  end

  def can_register?(contestant, game)
    if interested_and_18?(contestant, game) === true
      if game.national_drawing? === false && contestant.state_of_residence === "CO"
        true
      elsif game.national_drawing? === true && contestant.state_of_residence != "CO"
        true
      else
        false
      end
    else
      false
    end
  end

  def register_contestant(contestant, game)
    if registered_contestants.keys.include?("#{game.name}")        
      registered_contestants["#{game.name}"] << contestant
    else
      registered_contestants["#{game.name}"] = [contestant]
    end
  end
end
