class School
  attr_reader :start_time, :hours_in_school_day, :student_names
  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
    (@start_time.to_i + hours_in_school_day).to_s + ":00"
  end

  def is_full_time?
    if hours_in_school_day == 7
      true
    else
      false
    end
  end

  def standard_student_names
    student_names.map do |student|
      student.capitalize
    end
  end
end
