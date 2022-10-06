Rails.application.routes.draw do
  post 'api/v1/register/:username/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
  namespace :api do
    namespace :v1 do
      get 'pages/index'
      resources :doctors, only: [:index, :create, :destroy]
    end
  end
end
