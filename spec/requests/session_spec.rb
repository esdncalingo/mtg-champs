require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Session Controller', type: :request do
  let(:client) { FactoryBot.create(:client) }
  let(:user) { FactoryBot.create(:user) }
  describe 'POST /auth/signin' do    
    it 'returns 200 OK if client key is found' do
      post '/api/v1/auth/signin', params: { token: client.token, 
        auth: { 
          email: user.email, 
          password: 'password123' 
        } 
      }
      expect(response).to have_http_status(:ok)
    end

    it 'returns status 422 if wrong email and password' do
      post '/api/v1/auth/signin', params: { token: client.token, 
        auth: { 
          email: user.email, 
          password: 'password13' 
        } 
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'POST /api/v1/auth' do
    it 'creates a new user successfully' do
      post "/api/v1/auth", params: { token: client.token, 
        auth: { 
          email: Faker::Internet.email, 
          password: Faker::Internet.password, 
          nickname: Faker::Name.name
        } 
      }
      expect(response).to have_http_status(:ok)
    end

    it 'returns status 422 if email is empty' do
      post "/api/v1/auth", params: { token: client.token, 
        auth: { 
          email: '', 
          password: Faker::Internet.password, 
          nickname: Faker::Name.name
        } 
      }
      expect(JSON.parse(response.body)['error'][0]).to eq("Email can't be blank")
    end

    it 'returns error messages for invalid user creation' do
      post '/api/v1/auth', params: { 
        auth: { 
          email: 'test@example.com', 
          password: '', 
          nickname: 'TestUser' 
        } 
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
