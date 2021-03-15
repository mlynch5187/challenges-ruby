class School
  attr_reader :start_time, :hours_in_school_day
  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
  end
end
