Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
        # Session routes
        get "/signin" => "sessions#signin"

        # User routes
        resources :users
    end
  end

end
