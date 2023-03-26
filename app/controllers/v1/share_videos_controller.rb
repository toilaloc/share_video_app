class V1::ShareVideosController < ApplicationController
  def index
    render :index
  end

  def create
    share_video = ShareVideo.new(user_id: @user.id,
      youtube_link: share_video_params[:youtube_link],
      description: share_video_params[:description]
    )

    share_video.save!
  end

  private

  def share_video_params
    params.permit(:youtube_link, :description)
  end
end
