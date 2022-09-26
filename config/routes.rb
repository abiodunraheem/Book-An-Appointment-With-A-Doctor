Rails.application.routes.draw do
  get 'doctors/index'
  get 'doctors/new'
  get 'doctors/create'
  get 'doctors/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
