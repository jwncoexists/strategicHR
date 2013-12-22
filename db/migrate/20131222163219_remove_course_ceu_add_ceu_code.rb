class RemoveCourseCeuAddCeuCode < ActiveRecord::Migration
  def change
    remove_column :courses, :ceu
    add_column :ceus, :code, :string
  end
end
