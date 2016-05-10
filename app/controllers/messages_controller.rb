class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    #Current Users Messages
    @messages = Message.where('sender_user_id=? OR receiver_user_id=?', current_user.id, current_user.id)
  end

  def show

  end

  def new
    @user = User.find_by username: params[:username]
    #Checking If The User Exist
    if @user.nil?
      flash[:alert] = "No User Exists!"
      redirect_to '/'
    end
  end

  def create
    @user = User.find_by username: params[:username]
    if @user.nil?
      flash[:alert] = "User doesn't exist"
      redirect_to '/'
    else
      @message = Message.new
      @message.sender_user_id = current_user.id
      @message.receiver_user_id = @user.id
      @message.body = params[:body]
      if @message.sender_user_id == @message.receiver_user_id
        flash[:alert] = "You can't message yourself!"
        return redirect_to '/'
      end
      if @message.save
        flash[:notice] = "Message was successfully sent"
        redirect_to '/'
      else
        render :new
      end
    end
  end
end