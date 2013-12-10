class RenameSectionProgressesToSectionStatuses < ActiveRecord::Migration
  def change
    rename_table :section_progresses, :section_statuses
  end
end
