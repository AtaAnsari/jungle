class User < ActiveRecord::Base
  has_secure_password

  def  self.authenticate_with_credentials (email, password)
    sanitizedEmail = email.strip.downcase
    user = User.find_by_email(sanitizedEmail)
  
    if user && user.authenticate(password) 
      user
    else
      nil 
    end
  end

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
end
