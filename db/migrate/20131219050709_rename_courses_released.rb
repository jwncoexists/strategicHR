class RenameCoursesReleased < ActiveRecord::Migration
  def change
    rename_column :courses, :released?, :released
    rename_column :attempts, :passed?, :passed
  end
end
