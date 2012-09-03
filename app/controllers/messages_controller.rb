
class MessagesController < ApplicationController
  def index 
    @user=User.find(params[:user_id])
    @messages = Message.all
    respond_to do |format|
       format.html
       format.json { render json: @users }
     end
  end
  
  def create
    @user =User.find(params[:user_id])
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice]="successfully created the message"
    else
      render :action =>'index'
    end
  end
end
