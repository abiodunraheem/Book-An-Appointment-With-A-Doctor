Rails.application.routes.draw do
  post 'api/v1/register/:username/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
  get 'splash', to: 'users#register'
  namespace :api do
    namespace :v1 do
      get 'doctors/:user_id', to: 'doctors#index'
      post 'doctors/:user_id', to: 'doctors#create'
      get 'reservations/:user_id', to: 'reservations#index'
      post 'reservations/:user_id', to: 'reservations#create'
      resources :doctors, only: [:index, :create, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
