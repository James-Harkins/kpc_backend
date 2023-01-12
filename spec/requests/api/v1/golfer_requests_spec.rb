require 'rails_helper'

describe 'golfer endpoints' do
  describe 'POST /golfers request' do
    describe 'happy path' do
      it 'returns a 201 response and json for the newly created golfer' do
        json_payload = {
          first_name: 'Tony',
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'varsityAthlete'
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
        expect(golfer[:attributes][:first_name]).to eq(json_payload[:first_name])
        expect(golfer[:attributes][:last_name]).to eq(json_payload[:last_name])
        expect(golfer[:attributes][:password_digest]).not_to eq(json_payload[:password])
      end
    end

    describe 'sad path' do
      it 'returns a 400 error response and json listing the error message for incomplete first name' do
        json_payload = {
          last_name: 'Soprano',
          email: 't@badabing.com',
          password: 'varsityAthlete',
          password_confirmation: 'varsityAthlete'
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
          password_confirmation: 'varsityAthlete'
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
          password_confirmation: 'varsityAthlete'
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
          password: 'varsityAthlete'
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
          password_confirmation: 'neverVarsityAthlete'
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
          password_confirmation: 'varsityAthlete'
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
end
