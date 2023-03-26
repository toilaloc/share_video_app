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
      render :index, :locals => {:current_user => @current_user, :shared_videos => @shared_videos}
    else
      flash[:success] = 'Something went wrong!'
      render :index, :locals => {:current_user => @current_user, :shared_videos => @shared_videos}
    end
  end

  private

  def share_video_params
    params.permit(:youtube_link, :description)
  end

  def get_youtube_video_id
    return if share_video_params[:youtube_link].blank?

    video_id = share_video_params[:youtube_link].split("/").last

    video_id.delete("watch?v=")
  end
end
