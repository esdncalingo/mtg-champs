class ApplicationController < ActionController::API
  # generates client key
  def require_client_key
    client ||= Client.find_by(token: params[:token])
    render json: { error: 'you shall not pass' }, status: :unprocessable_entity unless client
  end

  def require_user_token
    
    if params[:access_token].present?
      @user = User.find_by(access_token: params[:access_token])
      render json: { error: 'Invalid Credentials' }, status: :unprocessable_entity unless @user.present?
    else
      render json: { error: 'Invalid Parameters' }, status: :unprocessable_entity
    end
  end
end
