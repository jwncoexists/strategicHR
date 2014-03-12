class RenameResourceImageToPhoto < ActiveRecord::Migration
  def change
      rename_column :resources, :image, :photo
  end
end
