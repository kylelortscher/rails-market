class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by username: params[:username]
    #Checking If The User Exist
    if @user.nil?
      flash[:alert] = "No User Exists!"
      redirect_to '/'
    end
  end


  def create

  end
end