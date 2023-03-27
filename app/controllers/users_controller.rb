# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_shared_videos

  def index
    @current_user
    @shared_videos
  end

  def create
    user = User.find_by(email: registration_params[:email].downcase, encrypted_password: registration_params[:encrypted_password])
    if user.present?
      store_session(user)
      flash[:success] = 'Login successfully!'
    else
      user = User.new(registration_params)
      if user.save!
        store_session(user)
        flash[:success] = 'Register successfully!'
      else
        flash[:success] = 'Something went wrong!'
      end
    end

    redirect_to root_url, :shared_videos => @shared_videos
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to root_url, :shared_videos => @shared_videos
  end

  private

  def registration_params
    params.permit(:email, :encrypted_password)
  end

  def load_shared_videos
    @shared_videos = ShareVideo.get_all_and_user_email
  end
end
