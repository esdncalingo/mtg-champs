require 'rails_helper'

RSpec.describe 'Api::V1::EventsController', type: :request do
  let(:client) { FactoryBot.create(:client) }
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:access_token) { generate_access_token }
  let(:headers) { { 'Authorization' => access_token } }

  before do
    post '/api/v1/auth/signin', params: { token: client.token, 
      auth: { 
        email: user.email, 
        password: 'password123' 
      } 
    }
  end

  def generate_access_token
    response_body = JSON.parse(response.body)
    response_body['token']
  end

  describe 'GET /api/v1/event' do
    it 'returns a list of upcoming events' do
      get "/api/v1/event?token=#{client.token}", headers: headers
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/event' do
    it 'creates a new event successfully' do
      post "/api/v1/event?token=#{client.token}", headers: headers,
           params: { 
            title: 'New Event', 
            description: 'Test Event', 
            schedule: Date.today, 
            game_format: 'Test Format' 
          }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['success']).to eq('ok')
      expect(Event.last.title).to eq('New Event')
    end

    it 'returns an error for invalid event creation' do
      post "/api/v1/event?token=#{client.token}", 
        headers: headers, 
        params: { 
          title: '', 
          schedule: Date.today 
        }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).not_to be_empty
    end
  end

  describe 'DELETE /api/v1/event' do
    it 'deletes an existing event successfully' do
      delete "/api/v1/event?id=#{event.id}&token=#{client.token}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['success']).to eq('Event removed')
    end
  end

  describe 'GET /api/v1/event/:id/view' do
    it 'returns an event and its creator' do
      get "/api/v1/event/#{event.id}/view?token=#{client.token}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['event']).not_to be_nil
      expect(JSON.parse(response.body)['created_by']).not_to be_nil
    end

    it 'returns an error for invalid event id' do
      get "/api/v1/event/invalid-id/view?token=#{client.token}", headers: headers
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Not Found')
    end
  end
end
