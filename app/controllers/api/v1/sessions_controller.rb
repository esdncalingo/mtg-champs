class Api::V1::SessionsController < ApplicationController
  before_action :require_client_key

  # POST /auth/signin
  def signin
    if request.request_parameters[:email].present? && request.request_parameters[:password].present?
      @user, @token = User.generate_token(user_params)
      if @user.present?
        response.headers['access_token'] = @token
        render json: { success: 'ok' }, status: :ok
      else
        render json: { error: ['Invalid username and password'] }, status: :unprocessable_entity
      end
    else
      render json: { error: ['parameters not found'] }, status: :unprocessable_entity
    end
  end

  # POST /auth
  def signup
    if request.request_parameters[:email].present? && request.request_parameters[:password].present?
      @user, @error_messages = User.create_account(user_params)
      if @error_messages.nil?
        render json: { success: "#{params[:email]} newly created" }, status: :ok
      else
        render json: { error: @error_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: ['parameters not found'] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :nickname)
  end
end
