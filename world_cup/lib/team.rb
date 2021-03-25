class Team
  attr_reader :country, :eliminated, :players
  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    x = []
    @players.each do |player|
      if player.position === position
        x << player
      end
    end
    x
  end
end
