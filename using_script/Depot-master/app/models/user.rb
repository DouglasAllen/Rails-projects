class User < ActiveRecord::Base

	after_destroy :ensure_an_admin_remains

  attr_accessible :name, :password, :password_confirmation

  #:password_digest

  # Name must be present and uniquen
  validates :name, :presence => true, :uniqueness => true

  # Passwor should be secure
  # We can use Devise gem package for it too.
  has_secure_password

  private

  # at least one user must me there
  	def ensure_an_admin_remains
  		if User.count.zero?
  			raise "Can't delete last User"
  		end  		
  	end
  
end
