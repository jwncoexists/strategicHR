class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,             null: false
      t.string :password_digest,  null: false, default: ""
      t.string :email,            null: false, unique: true, default: ""
      t.string :account
      t.string :slug
      t.date :confirmed_at,       default: nil

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :confirmed_at
    add_reference :courses, :users, index: true, presence: true
  end
end
