class GolferTripCourse < ApplicationRecord
  belongs_to :golfer
  belongs_to :trip_course
end
