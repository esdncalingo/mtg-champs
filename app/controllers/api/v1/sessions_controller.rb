class Api::V1::SessionsController < ApplicationController
  def new_session
  end

  def signin 
    render json: 'your signin'
  end

  def signup 
  end

  def signout
  end
end