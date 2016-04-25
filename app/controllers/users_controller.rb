class UsersController < ApplicationController

  #Get Request Of Signups
  def new

  end

  #Post Request
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id]
      redirect_to '/'
    else
      redirect_to 'signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end