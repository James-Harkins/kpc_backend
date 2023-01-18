class Api::V1::TripsController < ApplicationController
  def index
    trips = Trip.all
    render json: TripSerializer.new(trips), status: 200
  end

  def show
    trip = Trip.find(params[:id])
    trip_response = Hash.new
    trip_response[:data] = Hash.new
    trip_response[:data][:id] = trip.id
    trip_response[:data][:type] = 'trip'
    trip_response[:data][:attributes] = Hash.new
    trip_response[:data][:attributes][:year] = trip.year
    trip_response[:data][:attributes][:number] = trip.number
    trip_response[:data][:attributes][:location] = trip.location
    trip_response[:data][:attributes][:courses] = trip.courses.distinct.map do |course|
      course_data = Hash.new
      course_data[:id] = course.id
      course_data[:name] = course.name
      course_data[:address] = course.address
      course_data[:city] = course.city
      course_data[:state] = course.state
      course_data[:zipcode] = course.zipcode
      course_data
    end
    trip_response[:data][:attributes][:nights] = trip.nights.map do |night|
      night_data = Hash.new
      night_data[:id] = night.id
      night_data[:date] = night.date
      night_data[:cost] = night.cost
      night_data
    end
    trip_response[:data][:attributes][:meals] = trip.meals.map do |meal|
      meal_data = Hash.new
      meal_data[:id] = meal.id
      meal_data[:date] = meal.date
      meal_data[:time_of_day] = meal.time_of_day
      meal_data[:cost] = meal.cost
      meal_data
    end
    trip_response[:data][:attributes][:golfers] = trip.golfers.map do |golfer|
      golfer_data = Hash.new
      golfer_data[:id] = golfer.id
      golfer_data[:first_name] = golfer.first_name
      golfer_data[:last_name] = golfer.last_name
      golfer_data[:email] = golfer.email
      golfer_data
    end
    render json: trip_response, status: 200
  end
end
