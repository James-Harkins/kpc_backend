class Api::V1::TripsController < ApplicationController
  def index
    trips = Trip.all
    render json: TripSerializer.new(trips), status: 200
  end

  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(trip), status: 200
  end

  def create
    trip = Trip.create!(trip_params)
    TripFacade.create_trip_relationships(trip, params)
    render json: TripSerializer.new(trip), status: 201
  end

  private
  def trip_params
    params.permit(:year, :number, :location)
  end
end
