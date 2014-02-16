class AddDualUserCourseIndexToStat < ActiveRecord::Migration
  def change
    add_index :stats, [:user_id, :course_id]
  end
end
