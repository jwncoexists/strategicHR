class AddCourseIdToAttempt < ActiveRecord::Migration
  def change
    add_reference :attempts, :courses, index: true
  end
end
