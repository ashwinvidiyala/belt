class User < ActiveRecord::Base
  has_many :products

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }

  before_save { self.email.downcase! }

end
