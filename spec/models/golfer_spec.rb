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

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }

    describe 'email' do
      before do
        golfer_1 = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 'wokeupthismorning@gmail.com', password: 'test123', password_confirmation: 'test123')
      end

      it { should allow_value('cleavermovie@gmail.com').for(:email) }
      it { should_not allow_value('wokeupthismorning@gmail.com').for(:email) }
    end

    it { should validate_presence_of(:password) }
    it { should have_secure_password }

    it 'should not have a password attribute and the password_digest attribute should be a hash' do
      golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 'wokeupthismorning@gmail.com', password: 'test123', password_confirmation: 'test123')
      expect(golfer).to_not have_attribute(:password)
      expect(golfer.password_digest).to_not eq('password123')
    end

    it 'should be initialized with a default role' do
      golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 'wokeupthismorning@gmail.com', password: 'test123', password_confirmation: 'test123')

      expect(golfer.role).to eq('default')
    end
  end
end
