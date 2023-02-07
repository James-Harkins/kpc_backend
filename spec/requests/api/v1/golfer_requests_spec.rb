require 'rails_helper'

describe 'golfer endpoints' do
  describe 'GET /golfers' do
    describe 'happy path' do
      it 'returns serialized json for all of the golfers in the database' do
        @golfer_1 = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')
        @golfer_2 = Golfer.create!(first_name: 'Paulie', last_name: 'Gaultieri', email: 'walnuts@badabing.com', password: 'test123', password_confirmation: 'test123')
        @golfer_3 = Golfer.create!(first_name: 'Christopher', last_name: 'Moltisanti', email: 'chrissie@badabing.com', password: 'test123', password_confirmation: 'test123')
        @trip_5 = Trip.create!(year: 2024, number: 'XXIV', location: 'VA Beach', start_date: Date.parse('2024-04-21'))
        @golfer_2_trip_5 = @trip_5.golfer_trips.create!(golfer: @golfer_2)

        get "/api/v1/golfers?api_key=#{ENV["API_KEY"]}"

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        golfers = response_body[:data]

        expect(golfers.length).to eq(3)
        expect(golfers[0]).to be_a Hash
        expect(golfers[0][:id]).to eq(@golfer_1.id.to_s)
        expect(golfers[0][:type]).to eq('golfer')
        expect(golfers[0][:attributes].keys).to eq([:first_name, :last_name, :email, :role, :is_registered_for_next_trip, :golfer_trips])
        expect(golfers[0][:attributes][:first_name]).to eq(@golfer_1.first_name)
        expect(golfers[0][:attributes][:last_name]).to eq(@golfer_1.last_name)
        expect(golfers[0][:attributes][:email]).to eq(@golfer_1.email)
        expect(golfers[0][:attributes][:role]).to eq('default')
        expect(golfers[0][:attributes][:golfer_trips]).to eq({data: []})
        expect(golfers[0][:attributes][:is_registered_for_next_trip]).to eq(false)
        expect(golfers[1][:attributes][:golfer_trips].length).to eq(1)
        expect(golfers[1][:attributes][:is_registered_for_next_trip]).to eq(true)
        expect(golfers[2][:attributes][:golfer_trips]).to eq({data: []})
        expect(golfers[2][:attributes][:is_registered_for_next_trip]).to eq(false)
      end
    end
  end

  describe 'POST /golfers request' do
    describe 'happy path' do
      it 'returns a 201 response and json for the newly created golfer' do
        json_payload = {
          golfer: {
            first_name: 'Tony',
            last_name: 'Soprano',
            email: 't@badabing.com',
            password: 'varsityAthlete',
            password_confirmation: 'varsityAthlete',
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(201)

        response_body = JSON.parse(response.body, symbolize_names: true)
        golfer = response_body[:data]

        expect(golfer[:type]).to eq('golfer')
        expect(golfer).to have_key(:id)
        expect(golfer).to have_key(:attributes)
        expect(golfer[:attributes]).to be_a Hash
        expect(golfer[:attributes].keys).to eq([:first_name, :last_name, :email, :role, :is_registered_for_next_trip, :golfer_trips])
        expect(golfer[:attributes][:first_name]).to eq(json_payload[:golfer][:first_name])
        expect(golfer[:attributes][:last_name]).to eq(json_payload[:golfer][:last_name])
        expect(golfer[:attributes][:email]).to eq(json_payload[:golfer][:email])
        expect(golfer[:attributes][:role]).to eq('default')
      end
    end

    describe 'sad path' do
      it 'returns a 400 error response and json listing the error message for incomplete first name' do
        json_payload = {
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'varsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end

      it 'returns a 400 error response and json listing the error message for incomplete last name' do
        json_payload = {
          first_name: 'Tony',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'varsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end

      it 'returns a 400 error response and json listing the error message for incomplete password' do
        json_payload = {
          first_name: 'Tony',
          last_name: 'Soprano',
          email: 't@badabing.com',
          password_confirmation: 'varsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end

      it 'returns a 400 error response and json listing the error message for incomplete password confirmation' do
        json_payload = {
          first_name: 'Tony',
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end

      it 'returns a 400 error response and json listing the error message with unmatching passwords' do
        json_payload = {
          first_name: 'Tony',
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'neverVarsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end

      it 'returns a 400 error response and json listing the error message if the email already exists in the database' do
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')

        json_payload = {
          first_name: 'Tony',
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'varsityAthlete',
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/golfers', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a String
      end
    end
  end

  describe 'DELETE /golfers' do
    describe 'happy path' do
      it 'deletes the golfer in the database with the id passed in as a query param' do
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')

        expect(Golfer.find_by(email: 't@badabing.com')).to eq(golfer)

        json_payload = {
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        delete "/api/v1/golfers/#{golfer.id}", headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(204)

        expect(Golfer.find_by(email: 't@badabing.com')).to eq(nil)
      end
    end
  end
end
