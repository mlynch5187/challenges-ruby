class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end.reverse
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    by_interest = {}
    @exhibits.each do |exhibit|
      by_interest[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          by_interest[exhibit] << patron
        end
      end
    end
    by_interest
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest.values.flatten.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end.uniq
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    if winner === nil
      "No winners for this lottery"
    else
      "#{winner} has won the #{exhibit.name} exhibit lottery"
    end
  end
end
