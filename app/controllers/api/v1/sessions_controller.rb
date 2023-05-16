class Api::V1::SessionsController < ApplicationController
  before_action :require_client_key

  # GET /auth/signin
  def signin
    @user, @access_token = User.generate_token(auth_params)
    if @user.present?
      render json: { success: 'ok', token: @access_token }, status: :ok
    else
      render json: { error: ['Invalid username and password'] }, status: :unprocessable_entity
    end
  end

  # POST /auth
  def signup
    @user, @error_messages = User.create_account(user_params)
    if @error_messages.nil?
      render json: { success: "#{params[:email]} newly created" }, status: :ok
    else
      render json: { error: @error_messages }, status: :unprocessable_entity
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end

  def user_params
    params.require(:auth).permit(:email, :password, :nickname)
  end
end
