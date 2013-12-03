class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, presence: true
      t.text :description, presence: true
      t.decimal :price, precision: 8, scale: 2, default: 39.99
      t.string :slug
      t.timestamps
    end
  end
end
