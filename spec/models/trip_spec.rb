require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:nights) }
  it { should have_many(:meals) }
  it { should have_many(:trip_courses) }
  it { should have_many(:courses).through(:trip_courses) }
  it { should have_many(:golfer_trips) }
  it { should have_many(:golfers).through(:golfer_trips) }
end
