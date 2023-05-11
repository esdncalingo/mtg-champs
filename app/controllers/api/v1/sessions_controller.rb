class Api::V1::SessionsController < ApplicationController
  before_action :require_client_key

  def new_session
  end

  def signin 
    render json: 'your in'

  end

  def signup 
  end

  def signout
  end

  private

  def user_params
    params.permit(:email, :password,)
  end
end