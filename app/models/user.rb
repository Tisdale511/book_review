class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews

  # validates :password, presence: true
  # validates :password, confirmation: { case_sensitive: true }

  #has_secure_password
  #has_secure_password :recovery_password, validations: false
  validates :username, presence: true, uniqueness: true
end
