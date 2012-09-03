class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render json: @users }
    end


  end

  def show
    @user = User.find(params[:id])
    @pet = Pet.with_deleted.find_by_user_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render json: @user }
    end
  end

  protected

    def record_not_found
      flash[:error] = "The user you requested could not be found"
      redirect_to root_path
    end
end
