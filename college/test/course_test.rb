require 'minitest/autorun'
require './college/lib/student'
require './college/lib/course'

class StudentTest < Minitest::Test

  def setup
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  def test_it_exists
    assert_instance_of Course, @course
  end

  def test_it_has_a_name
    assert_equal "Calculus", @course.name
  end

  def test_it_has_a_capacity
    assert_equal 2, @course.capacity
  end

  def test_it_has_students
    assert_equal [], @course.students
  end

  def test_it_can_add_students
    assert_equal false, @course.full?

    @course.enroll(@student1)
    @course.enroll(@student2)

    assert_equal [@student1, @student2], @course.students
    assert_equal true, @course.full?
  end
end
