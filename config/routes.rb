Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # /api/v1/...
  namespace :api do
    namespace :v1 do
      scope :auth do
        # Session routes
        post '/' => 'sessions#signup'
        get '/signin' => 'sessions#signin'
      end
    end
  end
end
