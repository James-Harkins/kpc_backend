class Api::V1::GolferTripsController < ApplicationController
  def show
    trip_data = GolferTripFacade.golfer_trip_data(params)
    render json: GolferTripSerializer.serialize_trip(trip_data), status: 200
  end

  def index
    trips_data = GolferTripFacade.golfer_trips_data(params)
    render json: GolferTripSerializer.serialize_trips(trips_data), status: 200
  end

  def create
    trip_data = GolferTripFacade.create_new_golfer_trip(params)
    render json: GolferTripSerializer.serialize_trip(trip_data), status: :created
  end
end
