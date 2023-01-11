require 'rails_helper'

RSpec.describe Golfer, type: :model do
  describe 'relationships' do
    it { should have_many(:golfer_trips) }
    it { should have_many(:trips).through(:golfer_trips) }
    it { should have_many(:golfer_nights) }
    it { should have_many(:nights).through(:golfer_nights) }
    it { should have_many(:golfer_meals) }
    it { should have_many(:meals).through(:golfer_meals) }
    it { should have_many(:golfer_trip_courses) }
    it { should have_many(:trip_courses).through(:golfer_trip_courses) }
  end
end
