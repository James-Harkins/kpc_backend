require 'rails_helper'

RSpec.describe TripCourse, type: :model do
  it { should belong_to(:trip) }
  it { should belong_to(:course) }
end
