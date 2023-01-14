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
    trip_response[:data][:trip_number] = trip.number
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

  def index
    golfer = Golfer.find(params[:golfer_id])
    trips = golfer.trips
    trip_response = Hash.new
    trip_response[:data] = []
    trips.each do |trip|
      trip_data = Hash.new
      nights = golfer.nights.where(trip_id: trip.id)
      meals = golfer.meals.where(trip_id: trip.id)
      courses = golfer.golfer_trip_courses.joins(:trip_course).where(trip_courses: {trip_id: trip.id}).order(:date)
      trip_data = Hash.new
      trip_data[:id] = trip.id
      trip_data[:type] = 'golfer_trip'
      trip_data[:trip_number] = trip.number
      trip_data[:total_cost] = golfer.trip_total_cost(trip.id)
      trip_data[:attributes] = Hash.new
      trip_data[:attributes][:nights] = nights.map {|night| night.date}
      trip_data[:attributes][:meals] = meals.map {|meal| {meal.date => meal.time_of_day}}
      trip_data[:attributes][:courses] = courses.map do |gtc|
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
      trip_response[:data] << trip_data
    end
    render json: trip_response
  end

  def create
    golfer = Golfer.find(params[:golfer_id])
    trip = Trip.find(params[:trip_id])
    golfer_trip = GolferTrip.create!(golfer: golfer, trip: trip)
    params[:nights].each {|night| golfer.golfer_nights.create!(night_id: night)}
    params[:meals].each {|meal| golfer.golfer_meals.create!(meal_id: meal)}
    params[:courses].each {|trip_course| golfer.golfer_trip_courses.create!(trip_course_id: trip_course)}
    nights = golfer.nights.where(trip_id: trip.id)
    meals = golfer.meals.where(trip_id: trip.id)
    courses = golfer.golfer_trip_courses.joins(:trip_course).where(trip_courses: {trip_id: trip.id}).order(:date)
    trip_response = Hash.new
    trip_response[:data] = Hash.new
    trip_response[:data][:id] = trip.id
    trip_response[:data][:type] = 'golfer_trip'
    trip_response[:data][:trip_number] = trip.number
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
    render json: trip_response, status: :created
  end
end
