class ChangeCourseCeuToFloat < ActiveRecord::Migration
  def change
    change_column :courses, :ceu, :float, precision: 8, scale: 2, default: 1.5
  end
end
