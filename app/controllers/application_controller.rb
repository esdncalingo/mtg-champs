class ApplicationController < ActionController::API

  def require_client_key
    client ||= Client.find_by(token: params[:token])
    render json: { error: 'you shall not pass' }, status: :unprocessable_entity unless client
  end
end