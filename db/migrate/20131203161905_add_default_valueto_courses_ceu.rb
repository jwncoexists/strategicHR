class AddDefaultValuetoCoursesCeu < ActiveRecord::Migration
  def change
    change_column :courses, :ceu, :integer, default: 0
  end
end
