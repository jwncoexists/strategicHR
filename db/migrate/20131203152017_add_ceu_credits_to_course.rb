class AddCeuCreditsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :ceu, :integer
  end
end
