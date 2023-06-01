require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe ApplicationController, type: :request do
  let(:client) { FactoryBot.create(:client)}
  let(:user) { FactoryBot.create(:user)}

  describe "require_client_key" do
    it "returns 422 unprocessable_entity if client key is not found" do
      post '/api/v1/auth/signin', params: { token: '4949895asdawea' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq('you shall not pass')
    end

    it "returns 200 OK if client key is found" do
      post "/api/v1/auth/signin?token=#{client.token}", params: { 
        auth: { 
          email: user.email, 
          password: 'password123'
        }
      }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "require_user_token" do
    it "returns status 422 if user token is invalid" do
      post "/api/v1/event?token=#{client.token}",
        params: { auth: {
          email: user.email,
          password: 'password123'
        }}, 
        headers: { 'Authorization' => 'invalid_token' }
        
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq('Invalid Credentials')
    end

    it "returns status 422 if token is missing" do
      post "/api/v1/event?token=#{client.token}",
        params: { auth: {
          email: user.email,
          password: 'password123'
        }} 
        
      expect(JSON.parse(response.body)['error']).to eq('Invalid Parameters')
    end
  end
end
