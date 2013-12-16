class AddPassedToAttempt < ActiveRecord::Migration
  def change
    add_column :attempts, :passed, :boolean, default: false
  end
end
