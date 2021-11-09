class ArchiveSubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :archive_subscriptions
  attributes :title,
             :price,
             :status,
             :frequency

  # attribute :film_epks do |object|
  #   UserFilmEpkSerializer.new(object.film_epks)
  # end
end