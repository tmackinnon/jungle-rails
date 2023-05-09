class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: {case_sensitive: false }, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    
  end

end
