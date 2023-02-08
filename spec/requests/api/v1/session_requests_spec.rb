require 'rails_helper'

describe 'session endpoints' do
  describe 'POST /sessions request' do
    describe 'happy path' do
      it 'returns a 200 response and json for the retrieved user when successful' do
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')

        json_payload = {
          golfer: {
            email: 't@badabing.com',
            password: 'test123'
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/login', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        golfer = response_body[:data]

        expect(golfer[:type]).to eq('golfer')
        expect(golfer).to have_key(:id)
        expect(golfer).to have_key(:attributes)
        expect(golfer[:attributes]).to be_a Hash
        expect(golfer[:attributes][:first_name]).to eq('Tony')
        expect(golfer[:attributes][:last_name]).to eq('Soprano')
        expect(golfer[:attributes][:email]).to eq(json_payload[:golfer][:email])
        expect(golfer[:attributes][:role]).to eq('default')
      end
    end

    describe 'sad path' do
      it 'returns a 400 error showing that no golfer exists with that email if
          there is no golfer with that email address in the database' do
        json_payload = {
          golfer: {
            email: 't@badabing.com',
            password: 'test123'
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/login', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('No account exists with this email.')
      end

      it 'returns a 400 error showing invalid credentials if the password
          is incorrect' do
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')

        json_payload = {
          golfer: {
            email: 't@badabing.com',
            password: 'varsityAthlete'
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/login', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Invalid credentials.')
      end
    end
  end

  describe 'POST /logout' do 
    describe 'happy path' do 
      it 'returns a 200 response if the user is logged out successfully' do 
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 'ton@badabing.com', password: 'test123', password_confirmation: 'test123')

        json_payload = {
          golfer: {
            email: 't@badabing.com',
            password: 'test123'
          },
          api_key: ENV["API_KEY"]
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/login', headers: headers, params: json_payload.to_json

        post '/api/v1/logout'

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:logged_out]).to eq(true)
      end
    end
  end
end
