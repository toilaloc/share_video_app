class CreateShareVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :share_videos do |t|
      t.string :youtube_link, null: false, default: nil
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
