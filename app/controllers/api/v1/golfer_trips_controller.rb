class Api::V1::GolferTripsController < ApplicationController
  def show
    if params[:api_key] == ENV["API_KEY"]
      trip_data = GolferTripFacade.golfer_trip_data(params)
      render json: GolferTripSerializer.serialize_trip(trip_data), status: 200
    end
  end

  def index
    if params[:api_key] == ENV["API_KEY"]
      trips_data = GolferTripFacade.golfer_trips_data(params)
      render json: GolferTripSerializer.serialize_trips(trips_data), status: 200
    end
  end

  def create
    if params[:api_key] == ENV["API_KEY"]
      trip_data = GolferTripFacade.create_new_golfer_trip(params)
      render json: GolferTripSerializer.serialize_trip(trip_data), status: 201
    end
  end
end
