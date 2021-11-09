class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title,
             :price,
             :status,
             :frequency

  # attribute :film_epks do |object|
  #   UserFilmEpkSerializer.new(object.film_epks)
  # end
end