require 'minitest/autorun'
require './college/lib/student'

class StudentTest < Minitest::Test

  def setup
    @student = Student.new({name: "Morgan", age: 21})
  end

  def test_it_exists
    assert_instance_of Student, @student
  end

  def test_it_has_a_name
    assert_equal "Morgan", @student.name
  end

  def test_it_has_an_age
    assert_equal 21, @student.age
  end

  def test_it_has_scores
    assert_equal [], @student.scores
  end

  def test_scores_can_be_logged
    @student.log_score(89)
    @student.log_score(78)

    assert_equal [89,78], @student.scores
  end
end
