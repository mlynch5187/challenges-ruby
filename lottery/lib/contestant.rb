class Contestant
  attr_reader :full_name, :age, :state_of_residence, :spending_money
  def initialize(attributes)
    @full_name = attributes[:first_name] + " " + attributes[:last_name]
    @age = attributes[:age]
    @state_of_residence = attributes[:state_of_residence]
    @spending_money = attributes[:spending_money]
  end
end
