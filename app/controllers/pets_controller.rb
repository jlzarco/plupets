class PetsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :has_pet?, only: [:new, :create]
  before_filter :correct_user, only: [:new, :create, :edit, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
   @pets = Pet.all
   respond_to do |format|
     format.html
     format.json { render json: @users }
   end
  end

  def show
    @user = User.find(params[:user_id])
    #@pet = Pet.find(params[:pet_id])
    @pet = @user.pet
    respond_to do |format|
      format.html
      format.json { render json: @pet }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @pet = @user.build_pet
    respond_to do |format|
      format.html
      format.json { render json: @pet }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @pet = @user.build_pet(params[:pet])
    respond_to do |format|
      if @pet.save
        flash[:notice] = 'Pet created'
        format.html  { redirect_to current_user }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    #@pet = Pet.find(params[:id])
    @pet = @user.pet
  end

  def update
    @user = User.find(params[:user_id])
    @pet = @user.pet
    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @user, notice: "#{@pet.name}'s profile was successfully updated." }
        format.json
      else
        format.html { render action: "edit" }
        format.json
      end
    end
  end

  def destroy
  @user = User.find(params[:user_id])
  @pet = @user.pet.destroy
  redirect_to current_user, notice: "Pet deleted"
  end

  protected

    def record_not_found
      flash[:error] = "The pet you requested could not be found"
    end

  private

    def has_pet?
      @user = User.find(params[:user_id])
      if @user.pet
       flash[:error] = "You can only have one pet for now"
       redirect_to @user
      end
    end

    def correct_user
      @user = User.find(params[:user_id])
      unless @user == current_user
        flash[:error] = "You are not authorized to do this action"
        redirect_to root_path
      end
    end

end
