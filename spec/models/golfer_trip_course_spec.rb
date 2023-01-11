require 'rails_helper'

RSpec.describe GolferTripCourse, type: :model do
  describe 'relationships' do
    it { should belong_to(:golfer) }
    it { should belong_to(:trip_course) }
  end
end
