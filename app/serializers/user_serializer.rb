class UserSerializer
  include FastJsonapi::ObjectSerializer
  # has_many :subscriptions
  attributes :email,
             :first_name,
             :last_name

  # attribute :film_epks do |object|
  #   UserFilmEpkSerializer.new(object.film_epks)
  # end
end