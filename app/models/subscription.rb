class Subscription < ApplicationRecord
  enum status: [ :active, :archived ]
  enum frequency: [ :weekly, :bi_weekly, :monthly]
  belongs_to :user
end 