class User < ApplicationRecord
  # has_many :subscriptions
  has_secure_password
end
