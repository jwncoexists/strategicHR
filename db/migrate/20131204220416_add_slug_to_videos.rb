class AddSlugToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :slug, :string
  end
end
