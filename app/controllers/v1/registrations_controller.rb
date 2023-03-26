class V1::RegistrationsController < ApplicationController
  def index
    render :index
  end

  def create
    @user = User.create! registration_params

    render :index, @user
  end

  private

  def registration_params
    params.permit(:email, :encrypted_password)
  end
end
