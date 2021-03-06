class User < ApplicationRecord

  has_secure_password

  validates	:email, :format => { :with => /@/ }
  
  validates :first_name, 
         :length => { :in => 2..30 }
  
  validates :last_name, 
         :length => { :in => 2..30 }
  
  validates :password, 
         :length => { :in => 8..24 }, 
         :allow_nil => true

  before_create :generate_token

  def generate_token
  	begin
    		self[:auth_token] = SecureRandom.urlsafe_base64
  	end while User.exists?(:auth_token => self[:auth_token])
	end

	def regenerate_auth_token
  	self.auth_token = nil
  	generate_token
  	save!
	end
end
