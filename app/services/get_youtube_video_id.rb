# frozen_string_literal: true

class Services::GetYoutubeVideoId < BaseService
  def initialize *args
    @youtube_link = args[:youtube_link]
  end

  private

  def get_youtube_video_id
    return if @youtube_link.blank?

    video_id = @youtube_link.split("/").last

    video_id.delete("watch?v=")
  end
end
