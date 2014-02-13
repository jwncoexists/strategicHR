class AddHandoutToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :handout, :string
  end
end
