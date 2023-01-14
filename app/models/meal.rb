class Meal < ApplicationRecord
  belongs_to :trip
  has_many :golfer_meals
  has_many :golfers, through: :golfer_meals

  enum time_of_day: [:breakfast, :dinner]
end
