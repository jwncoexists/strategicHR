class RenameAttemptCoursesId < ActiveRecord::Migration
  def change
    rename_column :attempts, :courses_id, :course_id
  end
end
