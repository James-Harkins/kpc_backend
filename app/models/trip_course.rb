class TripCourse < ApplicationRecord
  belongs_to :trip
  belongs_to :course
  has_many :golfer_trip_courses
end
