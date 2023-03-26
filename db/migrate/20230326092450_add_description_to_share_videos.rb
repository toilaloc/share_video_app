class AddDescriptionToShareVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :share_videos, :description, :string
  end
end
