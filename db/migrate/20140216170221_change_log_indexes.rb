class ChangeLogIndexes < ActiveRecord::Migration
  def change
    remove_index :logs, :course_id
    remove_index :logs, :video_id
    add_index :logs, [:user_id, :url, :tracked]
  end
end
