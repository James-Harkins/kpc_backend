class GolferSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :role

  attributes :is_registered_for_next_trip do |golfer|
    trip = Trip.where('start_date > ?', Date.today).first
    trip ? trip.golfers.any? {|trip_golfer| trip_golfer.id == golfer.id} : false
  end

  attributes :golfer_trips do |golfer|
    trips_data = GolferTripFacade.golfer_trips_data({golfer_id: golfer.id})
    GolferTripSerializer.serialize_trips(trips_data)
  end
end
