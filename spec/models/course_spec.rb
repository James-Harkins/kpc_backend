require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'relationships' do
    it { should have_many(:trip_courses) }
    it { should have_many(:trips).through(:trip_courses) }
    it { should have_many(:golfer_trip_courses).through(:trip_courses) }
  end
end
