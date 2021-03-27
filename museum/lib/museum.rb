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
end
