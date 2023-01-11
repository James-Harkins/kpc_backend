class GolferMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :golfer
end
