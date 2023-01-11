require 'rails_helper'

RSpec.describe GolferMeal, type: :model do
  describe 'relationships' do
    it { should belong_to(:meal) }
    it { should belong_to(:golfer) }
  end
end
