class PhotosController < ApplicationController
  def index
    @pet=Pet.find(params[:pet_id])
  end
  def new
    @pet = Pet.find(params[:pet_id])
    @photo=@pet.photos.new
  end

  def edit
   @pet=Pet.find(params[:pet_id])
    @photo = Photo.find(params[:id])
  end
  def create
      @pet = Pet.find(params[:pet_id])
      @photo=@pet.photos.new(params[:photo])
    if@photo.save
      flash[:notice]="successfully created de photo"
      redirect_to pet_photos_path(@pet)
    else
      render :action =>'new'
  end
end
  def update
    @pet=Pet.find(params[:pet_id])
    @photo =@pet.photos.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to pet_photos_path(@pet)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pet=Pet.find(params[:pet_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to pet_photos_path(@pet)
  end
end
