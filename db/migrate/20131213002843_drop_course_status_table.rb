class DropCourseStatusTable < ActiveRecord::Migration
  def change
    drop_table :course_statuses
  end
end
