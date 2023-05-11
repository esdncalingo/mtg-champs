class ApplicationController < ActionController::API

  def require_client_key
    client ||= Client.find_by(token: client_params)

    if client.present?
      render json: 'your good'
    else 
      render json: { error: 'you shall not pass' }, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.permit(:token)
  end
end
