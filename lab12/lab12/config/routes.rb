Rails.application.routes.draw do
  root 'palindrom#input'
  post 'palindrom/show'

  get 'session/new'
  post 'session/create'
  delete 'session/destroy'
  resources :results
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
