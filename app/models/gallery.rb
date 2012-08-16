class Gallery < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  has_many :photos
  #belongs_to :pet
end
