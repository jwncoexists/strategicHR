class DropSectionStatus < ActiveRecord::Migration
  def change
    drop_table :section_statuses
  end
end
