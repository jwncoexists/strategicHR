class AddDualSectionUserIndexToAttempts < ActiveRecord::Migration
  def change
    add_index :attempts, [:section_id, :user_id]
  end
end
