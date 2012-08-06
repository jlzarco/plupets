class User < ActiveRecord::Base
  has_and_belongs_to_many :role
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:role_ids ,:provider
  
  # attr_accessible :title, :body
 # devise (...), :timeoutable

    def timeout_in
      if user.admin? # should this not be 'self.admin?' ?
        1.year
      else
        2.days
      end
    end
    def role?(role)
        return !!self.roles.find_by_name(role.to_s.camelize)
      end
      
      
end
