class Team
  attr_reader :country, :eliminated
  def initialize(country)
    @country = country
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end
end
