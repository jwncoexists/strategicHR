class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :video, index: true
      t.text :url
      t.string :status
      t.datetime :time
      t.boolean :tracked, default: false

      t.timestamps
    end
  end
end
