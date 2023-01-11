class Course < ApplicationRecord
  has_many :trip_courses
  has_many :trips, through: :trip_courses
  has_many :golfer_trip_courses, through: :trip_courses 
end
