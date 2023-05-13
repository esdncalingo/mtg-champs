class Api::V1::DecksController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token
  before_action :set_deck, only: [:update, :destroy, :cards]

  # GET /api/v1/deck
  def show
    render json: { data: @user.decks }, status: :ok
  end

  # POST /api/v1/deck
  def create
    @deck = @user.decks.new(deck_params)

    if @deck.save
      render json: { success: 'ok', deck: @deck }, status: :ok
    else
      render json: { error: @deck.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @deck.update(deck_params)
      render json: { success: 'ok', deck: @deck }, status: :ok
    else
      render json: { error: @deck.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/deck
  def destroy
    if @deck.destroy
      render json: { success: 'Deck deleted' }, status: :ok
    end
  end

  def cards
    render json: { cards: @deck.cards }, status: :ok
  end

  private

  def deck_params
    params.permit(:name, :cards, :sideboard, :game_format)
  end

  def set_deck
    @deck = @user.decks.find(request.request_parameters[:id])
  end
end
