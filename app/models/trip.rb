class Trip < ApplicationRecord
  has_many :nights
  has_many :meals
  has_many :trip_courses
  has_many :courses, through: :trip_courses
  has_many :golfer_trips
  has_many :golfers, through: :golfer_trips
end
