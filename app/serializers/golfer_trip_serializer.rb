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

  def self.serialize_trips(trips_data)
    trips_response = Hash.new
    trips_response[:data] = []
    trips_data.map do |trip|
      trip_response = Hash.new
      trip_response[:id] = GolferTripFacade.trip_id(trip)
      trip_response[:type] = 'golfer_trip'
      trip_response[:trip_year] = GolferTripFacade.trip_year(trip)
      trip_response[:trip_number] = GolferTripFacade.trip_number(trip)
      trip_response[:total_cost] = GolferTripFacade.trip_total_cost(trip)
      trip_response[:attributes] = Hash.new
      trip_response[:attributes][:nights] = GolferTripFacade.map_nights(trip)
      trip_response[:attributes][:meals] = GolferTripFacade.map_meals(trip)
      trip_response[:attributes][:courses] = GolferTripFacade.map_courses(trip)
      trips_response[:data] << trip_response
    end
    trips_response
  end
end
