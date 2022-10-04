Rails.application.routes.draw do
  post 'api/v1/register/:username/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
  get 'splash', to: 'users#register'
  get 'users/:id', to: 'users#index'
  namespace :api do
    namespace :v1 do
      get 'reservations/:user_id', to: 'reservations#index'
      resources :users, only: [:index, :create] do
        resources :doctors, only: [:index, :show, :create, :destroy]
        resources :reservations, only: [:index, :create]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
