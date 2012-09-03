class PetsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :has_pet?, only: [:new, :create]
  before_filter :correct_user, only: [:new, :create, :edit, :destroy]
  before_filter :hidden_pet?, only: [:edit, :update]
  before_filter :visiting_hidden_pet?, only: :show
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
    #@pet = @user.pet
    #@pet = @user.pet.with_deleted
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
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
    #@pet = @user.pet
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    #@pet = @user.pet
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
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
    #@pet = @user.pet
    #@pet = @user.pet
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
    @pet.destroy!
    redirect_to @user, notice: "Pet deleted"
  end

  def hide
    @user = User.find(params[:user_id])
    #@pet = @user.pet
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
    @pet.destroy
    redirect_to @user, notice: "Pet hidden"
  end

  def recover
    @user = User.find(params[:user_id])
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
    @pet.recover
    redirect_to @user, notice: "Pet recovered, please update your pet's avatar"

  end

  protected

  def record_not_found
    flash[:error] = "The pet you requested could not be found"
  end

  private

  def has_pet?
    @user = User.find(params[:user_id])
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
    #if @user.pet
    if @pet
      flash[:error] = "You can only have one pet for now"
      redirect_to @user
    end
  end

  def hidden_pet?
    @user = User.find(params[:user_id])
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])
    if @pet.deleted?
      flash[:error] = "You can't edit a hidden pet"
      redirect_to @user
    end
  end

  def visiting_hidden_pet?
    @user = User.find(params[:user_id])
    @pet = Pet.with_deleted.find_by_user_id(params[:user_id])

    if @pet.deleted? and current_user != @user
      flash[:error] = "Pet not found"
      redirect_to root_path
    end
  end
end
