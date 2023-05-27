class Api::V1::ParticipantsController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token
  before_action :set_event, only: [:create]
  before_action :set_participant, only: [:update, :destroy, :deck_submit]

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

  #  PATCH /api/v1/event/participant - Update Status
  def update
    if @participant.update(status: params[:status])
      render json: { success: 'ok' }, status: :ok
    else 
      render json: { error: 'Something wrong' }, status: :unprocessable_entity
    end
  end

  #  DELETE /api/v1/event/participant
  def destroy
    if @participant.destroy
      render json: { success: 'ok' }, status: :ok
    else 
      render json: { error: 'failed' }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/event/participant/approved
  def approved
    @event = Event.find(params[:id])
    @participants = @event.users
                       .where(participants: { status: 'approved' })
                       .select(:id, :nickname)
                       .as_json(only: [:id, :nickname], root: false)
                       .map { |participant| { name: participant['nickname'], id: participant['id'], isWinner: false, resultText: '' } }
  
    if @participants.present?
      render json: { participants: @participants }, status: :ok
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end
  

  # GET /api/v1/event/participant/deck_submit
  def deck_submit
    if @user = @participant.user.nickname
      @deck = @participant.submitted_deck
      render json: { participant: @user, deck: @deck }, status: :ok
    else
      render json: { error: 'not found' }, status: :not_found
    end

  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def submitted_deck_params
    params.permit(:name, :game_format)
          .merge(cards: params[:cards], sideboard: params[:sideboard])
  end

end