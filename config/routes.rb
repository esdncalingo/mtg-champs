Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # action cable server
  mount ActionCable.server => '/participantscable'

  # /api/v1/...
  namespace :api do
    namespace :v1 do
      scope :auth do
        # Session routes
        post '/' => 'sessions#signup'
        post '/signin' => 'sessions#signin'
      end
      # Deck routes
      resource :deck do
        member do
          get :cards
          get ':id/view' => 'decks#view'
        end
      end
      # Event routes
      resource :event do
        resource :participant
      end
    end
  end
end
