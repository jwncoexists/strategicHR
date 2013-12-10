class RenameCourseProgressesToCourseStatuses < ActiveRecord::Migration
  def change
    rename_table :course_progresses, :course_statuses
  end
end
