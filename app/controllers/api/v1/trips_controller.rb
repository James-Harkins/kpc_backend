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
    params[:courses].each do |course|
      trip.trip_courses.create!(
        course_id: course[:course],
        date: course[:date],
        cost: course[:cost]
      )
    end
    params[:nights].each do |night|
      trip.nights.create!(
        date: night[:date],
        cost: night[:cost]
      )
    end
    params[:meals].each do |meal|
      trip.meals.create!(
        date: meal[:date],
        time_of_day: meal[:time_of_day],
        cost: meal[:cost]
      )
    end
    render json: TripSerializer.new(trip), status: 201
  end

  private
  def trip_params
    params.permit(:year, :number, :location)
  end
end
