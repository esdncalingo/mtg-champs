class Api::V1::UsersController < ApplicationController

  def index 
  end

  def create 
    User.create(user_params)
    render json: 'success'
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy 
  end

  private

  def user_params 
    params.permit(:email, :nickname, :password)
  end

end
