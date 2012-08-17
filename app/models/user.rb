class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  before_save :create_remember_token

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
