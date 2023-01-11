require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip) }
    it { should have_many(:golfer_meals) }
    it { should have_many(:golfers).through(:golfer_meals) }
  end
end
