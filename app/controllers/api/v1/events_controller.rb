class Api::V1::EventsController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token
  before_action :find_event, only: [:update, :destroy]

  # GET /api/v1/event
  def show
    render json: @user.events.reverse(), status: :ok
  end

  # POST /api/v1/event
  def create
    @event = @user.events.new(event_params)

    if @event.save
      render json: { success: 'ok', event: @event }, status: :ok
    else
      render json: { error: @event.errors }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/event
  def update
    if @event.update(event_params)
      render json: { success: 'ok', deck: @deck }, status: :ok
    else
      render json: { error: @event.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/event
  def destroy
    if @event.destroy
      render json: { success: 'Event removed' }, status: :ok
    end
  end

  private

  def find_event
    @event = @user.event.find(params[:id])
  end

  def event_params
    params.permit(:title, :description, :schedule, :game_format)
  end

end