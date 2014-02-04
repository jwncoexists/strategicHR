class AddYoutubeIdToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :youtube_id, :string
    add_index :videos, :youtube_id
  end
end
