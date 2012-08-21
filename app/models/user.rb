class User < ActiveRecord::Base
  #has_and_belongs_to_many :role
  has_many :authorizations, dependent: :destroy
  has_one :pet, dependent: :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,:omniauthable
         #:recoverable,
  #son los roles que puede adquirir
  ROLES = %w[admin loged info]
  #metodos que vienen en cancan 
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:roles ,:provider

  # attr_accessible :title, :body
 # devise (...), :timeoutable

    def timeout_in
      if user.admin? # should this not be 'self.admin?' ?
        1.year
      else
        2.days
      end
    end
    

    def apply_omniauth(omniauth)
      authorizations.build(provider: omniauth['provider'], uid: omniauth['uid'])
    end

    def password_required?
      (authorizations.empty? || !password.blank?) && super
    end
end
