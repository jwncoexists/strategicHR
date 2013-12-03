class CourseChangeUsersIdToSingular < ActiveRecord::Migration
  def change
      rename_column :courses, :users_id, :user_id
  end
end
