class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  before_save :downcase_email

   def downcase_email
      self.email.downcase!
   end

  def self.authenticate_with_credentials(email, password)
    user_email = email.strip.downcase
    @user = User.find_by(email: user_email)
    if @user && @user.authenticate(password) 
      @user
    else
      nil
    end

  end

end
