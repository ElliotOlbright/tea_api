class AddressSerializer
  include FastJsonapi::ObjectSerializer
  # has_many :subscriptions
  attributes :street,
             :city,
             :state,
             :zipcode

  # attribute :film_epks do |object|
  #   UserFilmEpkSerializer.new(object.film_epks)
  # end
end