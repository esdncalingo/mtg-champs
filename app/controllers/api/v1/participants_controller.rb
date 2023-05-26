class Api::V1::ParticipantsController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token
  before_action :set_event, only: [:create]

  def show
    # @event = Event.find(params[:id])
    @participants = Participant.event_participants(params[:id])
    render json: { participant: @participants }, status: :ok
  end

  # POST /api/v1/event/participant
  def create
    if @event.present?
      if params[:cards].present?
        @participant = @event.participants.new
        @participant.user = @user

        if @participant.save
          @participant.submitted_deck = SubmittedDeck.create(submitted_deck_params)
          render json: { success: 'ok' }, status: :ok
        else 
          render json: { error: @participant.errors }, status: :unprocessable_entity
        end
      else 
        render json: { error: 'require a deck to submit' }, status: :unprocessable_entity
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def submitted_deck_params
    params.permit(:name, :game_format)
          .merge(cards: params[:cards], sideboard: params[:sideboard])
  end

end