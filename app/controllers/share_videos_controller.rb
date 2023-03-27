# frozen_string_literal: true

class ShareVideosController < ApplicationController
  def index
    @current_user
    @shared_videos
  end

  def create
    share_video = ShareVideo.new(
      user_id: @current_user.id,
      youtube_link: get_youtube_video_id,
      description: share_video_params[:description]
    )

    if share_video.save
      flash[:success] = 'Share video successfully!'
    else
      flash[:danger] = 'Something went wrong!'
    end

    redirect_to root_url, :shared_videos => @shared_videos
  end

  private

  def share_video_params
    params.permit(:youtube_link, :description)
  end

  def get_youtube_video_id
    GetYoutubeVideoId.new(youtube_link: share_video_params[:youtube_link]).call
  end
end
