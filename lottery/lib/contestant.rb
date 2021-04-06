class Contestant
  attr_reader :full_name, :age
  def initialize(attributes)
    @full_name = attributes[:first_name] + " " + attributes[:last_name]
    @age = attributes[:age]
  end
end
