class Api::V1::GolferTripsController < ApplicationController
  def show
    golfer = Golfer.find(params[:golfer_id])
    trip = Trip.find(params[:id])
    nights = golfer.nights.where(trip_id: trip.id)
    meals = golfer.meals.where(trip_id: trip.id)
    courses = golfer.golfer_trip_courses.joins(:trip_course).where(trip_courses: {trip_id: trip.id})
    binding.pry
  end
end
