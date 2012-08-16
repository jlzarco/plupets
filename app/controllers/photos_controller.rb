class PhotosController < ApplicationController
  def new
    @photo = photo.new(:pet_id => params[:pet_id])
  end

  def edit
    @photo = photo.find(params[:id])
  end

  def update
    @photo = photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo = photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to @photo.gallery
  end
end
