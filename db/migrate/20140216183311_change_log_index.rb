class ChangeLogIndex < ActiveRecord::Migration
  def change
    remove_index :logs, [:user_id, :url, :tracked]
    add_index :logs, [:user_id, :url, :status, :tracked]
  end
end
