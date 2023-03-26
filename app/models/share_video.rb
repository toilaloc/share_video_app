# frozen_string_literal: true

class ShareVideo < ApplicationRecord
  belongs_to :user

  scope :get_all_and_user_email, (lambda do
    joins(:user)
      .select("users.email AS user_email, share_videos.youtube_link, share_videos.description")
  end)
end
