class PetsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :has_pet?, only: [:new, :create]

  def index
   @pets = Pet.all
   respond_to do |format|
     format.html
     format.json { render json: @users }
   end
  end

  def show
    @pet = Pet.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @pet }
    end
  end

  def new
    @pet = Pet.new
    respond_to do |format|
      format.html
      format.json { render json: @pet }
    end
  end

  def create
    @pet = current_user.build_pet(params[:pet])
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
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: "#{@pet.name}'s profile was successfully updated." }
        format.json
      else
        format.html { render action: "edit" }
        format.json
      end
    end
  end

  def destroy
   current_user.pet.destroy
   redirect_to current_user, notice: "Pet deleted"
  end

  private

    def has_pet?
      if current_user.pet
       flash[:error] = "You can only have one pet for now"
       redirect_to current_user
      end
    end

end
