class Meal < ApplicationRecord
  belongs_to :trip
  has_many :golfer_meals
  has_many :golfers, through: :golfer_meals
end
