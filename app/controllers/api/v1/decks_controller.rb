class Api::V1::DecksController < ApplicationController
  before_action :require_client_key
  before_action :require_user_token
  before_action :set_deck, only: [:update, :destroy, :cards, :view]

  # GET /api/v1/deck
  def show
    render json: @user.decks, status: :ok
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

  # PATCH /api/v1/deck
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

  # GET /api/v1/deck/:id/view
  def view
    if @deck.present?
      render json: { deck: @deck }, status: :ok
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end

  # GET /api/v1/deck/:game_format
  def by_format
    @deck = @user.decks.where(game_format: params[:game_format])
    if @deck.present?
      render json: { deck: @deck }, status: :ok
    else 
      render json: { error: 'Not found' }, status: :not_found
    end
  end

  # GET /api/v1/deck/cards
  def cards
    render json: { cards: @deck.cards }, status: :ok
  end

  private

  def deck_params
    params.permit(:name, :game_format).merge(cards: params[:cards], sideboard: params[:sideboard])
  end

  def set_deck
    @deck = @user.decks.find(params[:id])
  end
end
