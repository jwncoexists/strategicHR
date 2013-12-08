class RenameSectionToSections < ActiveRecord::Migration
  def change
    rename_table :section, :sections
  end
end
