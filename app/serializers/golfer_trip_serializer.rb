class GolferTripSerializer
  def self.serialize_trip(trip_data)
    trip_response = Hash.new
    trip_response[:data] = Hash.new
    trip_response[:data][:id] = GolferTripFacade.trip_id(trip_data)
    trip_response[:data][:type] = 'golfer_trip'
    trip_response[:data][:trip_number] = GolferTripFacade.trip_number(trip_data)
    trip_response[:data][:total_cost] = GolferTripFacade.trip_total_cost(trip_data)
    trip_response[:data][:attributes] = Hash.new
    trip_response[:data][:attributes][:nights] = GolferTripFacade.map_nights(trip_data)
    trip_response[:data][:attributes][:meals] = GolferTripFacade.map_meals(trip_data)
    trip_response[:data][:attributes][:courses] = GolferTripFacade.map_courses(trip_data)
    trip_response
  end
end
