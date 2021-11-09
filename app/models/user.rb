class User < ApplicationRecord
  has_many :subscriptions
  has_many :addresses
  has_secure_password
end
