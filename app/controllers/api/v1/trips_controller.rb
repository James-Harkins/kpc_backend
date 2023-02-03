class Api::V1::TripsController < ApplicationController
  include Authenticatable
  
  def index
    if authenticated?(params)
      trips = Trip.all
      render json: TripSerializer.new(trips), status: 200
    end
  end

  def show
    if authenticated?(params)
      trip = Trip.find(params[:id])
      render json: TripSerializer.new(trip), status: 200
    end
  end

  def next_trip
    if authenticated?(params)
      trip = Trip.where('start_date > ?', Date.today).first
      if trip 
        render json: TripSerializer.new(trip), status: 200
      else
        render json: {data: {}}
      end
    end
  end

  def create
    if authenticated?(params)
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
