class Photo < ActiveRecord::Base
  attr_accessible :pet_id, :name, :image, :remote_image_url
  belongs_to :pet
  #belongs_to :gallery
  mount_uploader :image, ImageUploader 
end
