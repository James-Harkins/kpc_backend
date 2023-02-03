class GolferSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :role

  attributes :golfer_trips do |golfer|
    trips_data = GolferTripFacade.golfer_trips_data({golfer_id: golfer.id})
    GolferTripSerializer.serialize_trips(trips_data)
  end
end
