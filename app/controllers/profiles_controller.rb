class ProfilesController < ApplicationController
  #Show current user's profiles
  def index
    @user = User.find_by id: current_user.id
  end

  #Show other user's profiles and the service they offer
  def show
    @user = User.find_by username: params[:username]
  end
end