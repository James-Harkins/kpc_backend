class Api::V1::GolferTripsController < ApplicationController
  include Authenticatable
  
  def show
    if authenticated?(params)
      trip_data = GolferTripFacade.golfer_trip_data(params)
      render json: GolferTripSerializer.serialize_trip(trip_data), status: 200
    end
  end

  def index
    if authenticated?(params)
      trips_data = GolferTripFacade.golfer_trips_data(params)
      render json: GolferTripSerializer.serialize_trips(trips_data), status: 200
    end
  end

  def create
    if authenticated?(params)
      trip_data = GolferTripFacade.create_new_golfer_trip(params[:golfer_trip])
      render json: GolferTripSerializer.serialize_trip(trip_data), status: 201
    end
  end
end
