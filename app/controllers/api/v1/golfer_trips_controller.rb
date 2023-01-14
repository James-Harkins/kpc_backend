class Api::V1::GolferTripsController < ApplicationController
  def show
    golfer = Golfer.find(params[:golfer_id])
    trip = Trip.find(params[:id])
    nights = golfer.nights.where(trip_id: trip.id)
    meals = golfer.meals.where(trip_id: trip.id)
    courses = golfer.golfer_trip_courses.joins(:trip_course).where(trip_courses: {trip_id: trip.id})
    trip_response = Hash.new
    trip_response[:id] = trip.id
    trip_response[:type] = 'golfer_trip'
    trip_response[:total_cost]
  end
end
