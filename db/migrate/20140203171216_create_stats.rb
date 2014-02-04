class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.float :total_time

      t.timestamps
    end
  end
end
