require 'rails_helper'

describe 'course endpoints' do
  before do
    @course_1 = Course.create!(name: 'Kings Creek Country Club', address: '1 Kings Creek Cir', city: 'Rehoboth Beach', state: 'DE', zipcode: '19971')
    @course_2 = Course.create!(name: 'Rehoboth Country Club', address: '221 West Side Dr', city: 'Rehoboth Beach', state: 'DE', zipcode: '19971')
    @course_3 = Course.create!(name: 'The Salt Pond Golf Club', address: '402 Bethany Loop', city: 'Bethany Beach', state: 'DE', zipcode: '19930')
    @course_4 = Course.create!(name: 'American Classic Golf Club', address: '18485 Bethpage Dr', city: 'Lewes', state: 'DE', zipcode: '19958')
    @course_5 = Course.create!(name: 'Red Wing Lake Golf Course', address: '1144 Prosperity Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23451')
    @course_6 = Course.create!(name: 'Virginia Beach National Golf Club', address: '2500 Tournament Dr', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_7 = Course.create!(name: 'Hells Point Golf Club', address: '2700 Atwoodtown Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_8 = Course.create!(name: 'Heron Ridge Golf Club', address: '2973 Heron Ridge Dr', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
    @course_9 = Course.create!(name: 'Stumpy Lake Golf Course', address: '4797 Indian River Rd', city: 'Virginia Beach', state: 'VA', zipcode: '23456')
  end

  describe 'GET /courses' do
    describe 'happy path' do
      it 'returns data for all courses in the database' do
        get "/api/v1/courses?api_key=#{ENV["API_KEY"]}"

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        courses = response_body[:data]

        expect(courses.length).to eq(9)
        expect(courses[0]).to be_a Hash
        expect(courses[0][:id]).to eq(@course_1.id.to_s)
        expect(courses[0][:type]).to eq('course')
        expect(courses[0][:attributes]).to be_a Hash
        expect(courses[0][:attributes].keys).to eq([:name, :address, :city, :state, :zipcode])
        expect(courses[0][:attributes][:name]).to eq(@course_1.name)
        expect(courses[0][:attributes][:address]).to eq(@course_1.address)
        expect(courses[0][:attributes][:city]).to eq(@course_1.city)
        expect(courses[0][:attributes][:state]).to eq(@course_1.state)
        expect(courses[0][:attributes][:zipcode]).to eq(@course_1.zipcode)
      end
    end
  end

  describe 'POST /courses' do
    describe 'happy path' do
      it 'creates a new course with the provided parameters and returns serialized json for the new course' do
        json_payload = {
          name: 'Gauntlet Golf Club',
          address: '18 Fairway Dr',
          city: 'Fredericksburg',
          state: 'VA',
          zipcode: '22406',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post "/api/v1/courses", headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(201)

        response_body = JSON.parse(response.body, symbolize_names: true)
        course = response_body[:data]

        expect(course[:id]).to be_an String
        expect(course[:type]).to eq('course')
        expect(course[:attributes].keys).to eq([:name, :address, :city, :state, :zipcode])
        expect(course[:attributes][:name]).to eq('Gauntlet Golf Club')
        expect(course[:attributes][:address]).to eq('18 Fairway Dr')
        expect(course[:attributes][:city]).to eq('Fredericksburg')
        expect(course[:attributes][:state]).to eq('VA')
        expect(course[:attributes][:zipcode]).to eq('22406')
      end
    end
  end
end
