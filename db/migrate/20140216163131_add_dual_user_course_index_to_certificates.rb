class AddDualUserCourseIndexToCertificates < ActiveRecord::Migration
  def change
    add_index :certificates, [:user_id, :course_id]
  end
end
