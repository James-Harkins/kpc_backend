require 'rails_helper'

describe 'session endpoints' do
  describe 'POST /sessions request' do
    describe 'happy path' do
      it 'returns a 200 response and json for the retrieved user when successful' do
        golfer = Golfer.create!(first_name: 'Tony', last_name: 'Soprano', email: 't@badabing.com', password: 'test123', password_confirmation: 'test123')

        json_payload = {
          email: 't@badabing.com',
          password: 'test123',
        }

        headers = {'CONTENT_TYPE' => 'application/json'}

        post '/api/v1/sessions', headers: headers, params: json_payload.to_json

        expect(response).to have_http_status(200)

        response_body = JSON.parse(response.body, symbolize_names: true)
        golfer = response_body[:data]

        expect(golfer[:type]).to eq('golfer')
        expect(golfer).to have_key(:id)
        expect(golfer).to have_key(:attributes)
        expect(golfer[:attributes]).to be_a Hash
        expect(golfer[:attributes][:first_name]).to eq('Tony')
        expect(golfer[:attributes][:last_name]).to eq('Soprano')
        expect(golfer[:attributes][:email]).to eq(json_payload[:email])
        expect(golfer[:attributes][:role]).to eq('default')
      end
    end
  end
end
