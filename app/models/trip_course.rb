class TripCourse < ApplicationRecord
  belongs_to :trip
  belongs_to :course
end
