class AddReleasedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :released?, :boolean, default: false
    rename_column :attempts, :passed, :passed?
  end
end
