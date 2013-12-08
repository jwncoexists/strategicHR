class RenameCourseContentsToSection < ActiveRecord::Migration
  def change
    rename_table :course_contents, :section
  end
end
