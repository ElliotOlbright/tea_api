class UserSerializer
  include FastJsonapi::ObjectSerializer
  # has_many :subscriptions
  attributes :email,
             :first_name,
             :last_name

  attribute :addresses do |object|
    object.addresses
  end
end