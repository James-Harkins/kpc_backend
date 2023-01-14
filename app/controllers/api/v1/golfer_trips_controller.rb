class Api::V1::GolferTripsController < ApplicationController
  def show
    golfer = Golfer.find(params[:golfer_id])
    trip = Trip.find(params[:id])
    nights = golfer.nights.where(trip_id: trip.id)
    meals = golfer.meals.where(trip_id: trip.id)
    courses = golfer.golfer_trip_courses.joins(:trip_course).where(trip_courses: {trip_id: trip.id}).order(:date)
    trip_response = Hash.new
    trip_response[:data] = Hash.new
    trip_response[:data][:id] = trip.id
    trip_response[:data][:type] = 'golfer_trip'
    trip_response[:data][:total_cost] = golfer.trip_total_cost(trip.id)
    trip_response[:data][:attributes] = Hash.new
    trip_response[:data][:attributes][:nights] = nights.map {|night| night.date}
    trip_response[:data][:attributes][:meals] = meals.map {|meal| {meal.date => meal.time_of_day}}
    trip_response[:data][:attributes][:courses] = courses.map do |gtc|
      trip_course = TripCourse.find(gtc.trip_course_id)
      course = trip_course.course
      {
        date: trip_course.date,
        name: course.name,
        address: course.address,
        city: course.city,
        state: course.state,
        zip: course.zipcode
      }
    end
    render json: trip_response
  end
end
