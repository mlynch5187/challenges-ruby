class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost/2
  end

  def owed
    owed_by_participant = {}
    @participants.each_with_index do |(key, value), index|
      owed_by_participant[key] = total_cost/2 - value
    end
    owed_by_participant
  end
end
