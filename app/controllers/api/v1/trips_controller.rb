class Api::V1::TripsController < ApplicationController
  def index
    if params[:api_key] == ENV["API_KEY"]
      trips = Trip.all
      render json: TripSerializer.new(trips), status: 200
    end
  end

  def show
    if params[:api_key] == ENV["API_KEY"]
      trip = Trip.find(params[:id])
      render json: TripSerializer.new(trip), status: 200
    end
  end

  def create
    if params[:api_key] == ENV["API_KEY"]
      trip = Trip.create!(trip_params)
      TripFacade.create_trip_relationships(trip, params)
      render json: TripSerializer.new(trip), status: 201
    end
  end

  private
  def trip_params
    params.permit(:year, :number, :location)
  end
end
