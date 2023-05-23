class Api::V1::ParticipantsController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token

  def show
  end

  # POST /api/v1/event/participant
  def create
    Participant.create(participant_params)
  end

  def update
  end

  def destroy
  end

  private

  def participant_params
    params.permit(:event_id, :deck_id, :user_id, :status)
  end

end