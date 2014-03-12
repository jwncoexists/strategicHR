class RenameResourcePhotoToImage < ActiveRecord::Migration
  def change
    rename_column :resources, :photo, :image
  end
end
