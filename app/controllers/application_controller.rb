# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  def store_session user
    return unless user

    session[:user_id] = user.id

    current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] && @current_user.blank?
  end

  def login?
    current_user.present?
  end

  def logout
    session.delete[:user_id]
  end
end
