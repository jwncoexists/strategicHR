require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course names must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:name].any?
  end
  test "courses created with a name are valid" do
    course = Course.new(name: 'my course')
    assert course.valid?
  end
end
