class Golfer < ApplicationRecord
  has_many :golfer_trips
  has_many :trips, through: :golfer_trips
  has_many :golfer_nights
  has_many :nights, through: :golfer_nights
  has_many :golfer_meals
  has_many :meals, through: :golfer_meals
  has_many :golfer_trip_courses
  has_many :trip_courses, through: :golfer_trip_courses
end
