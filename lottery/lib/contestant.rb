class Contestant
  attr_reader :full_name
  def initialize(attributes)
    @full_name = attributes[:first_name] + " " + attributes[:last_name]
  end
end
