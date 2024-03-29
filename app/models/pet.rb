class Pet < ActiveRecord::Base
  attr_accessible :description, :name, :status, :user_id, :animal_type, :race, :avatar
  belongs_to :user
  has_many :photos
  validates_uniqueness_of :user_id
  validates_presence_of :animal_type, :status, :name, :race
  validates :description, presence: true, length: { maximum: 230 }
  mount_uploader :avatar, ImageUploader
  acts_as_paranoid

  STATUS = { '1' => 'Has owner',
             '2' => 'Looking for mate',
             '3' => 'Looking to be adopted' }
  TYPE = { 1 => 'Dog',
           2 => 'Cat',
           3 => 'Bird',
           4 => 'Aquarium Animal',
           5 => 'Farm Animal',
           6 => 'Exotic Animal' }

  STATUS.each do |k,v|
    define_method("#{k}?") do
      self.status == k
    end
  end

  TYPE.each do |k,v|
    define_method("#{k}?") do
      self.animal_type == k
    end
  end

end
