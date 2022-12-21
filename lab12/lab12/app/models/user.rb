class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true
  # validates :password, presence: true
  # validates_confirmation_of :password, message: 'Не совпадает пароль'
end
