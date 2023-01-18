class Api::V1::TripsController < ApplicationController
  def index
    trips = Trip.all
    render json: TripSerializer.new(trips), status: 200
  end
end