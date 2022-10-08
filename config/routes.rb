Rails.application.routes.draw do
  post 'api/v1/register/:username/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
  get 'api/v1/users/doctor/:id', to: 'users#user_doctor'
  get 'splash', to: 'users#register'
  get 'users/:id', to: 'users#index'
  namespace :api do
    namespace :v1 do
      get 'reservations/:user_id', to: 'reservations#index'
      post 'reservations/:user_id', to: 'reservations#create'
      get 'api/v1/doctor/:id', to: 'doctors#show'
      delete 'api/v1/doctors/:id', to: 'doctors#delete'
      resources :doctors, only: %i[index show create destroy] 
      resources :users do
        resources :reservations, only: %i[index show]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
