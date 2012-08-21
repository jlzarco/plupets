class PhotosController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :correct_user, only: [:new,:create,:edit,:destroy]
  def index
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photos = @pet.photos
    #respond_to do |format|
      #format.html
      #format.json
    #end
  end

  def new
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photo = @pet.photos.new
  end

  def create
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photo=@pet.photos.build(params[:photo])
    if @photo.save
      flash[:notice]="successfully created the photo"
      redirect_to user_pets_photos_path(@user)
    else
      render :action =>'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photo = @pet.photos.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photo = @pet.photos.find(params[:id])
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to user_pets_photos_path(@user), notice: "Successfully updated photo." }
        format.json
      else
        format.html { render action: "edit" }
        format.json
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @pet = @user.pet
    @photo = @pet.photos.find(params[:id])
    @photo.destroy
    redirect_to user_pets_photos_path(@user), notice: "Successfully destroyed photo"
  end
end
