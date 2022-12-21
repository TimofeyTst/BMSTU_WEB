Rails.application.routes.draw do
  root 'palindrom#input'
  get 'palindrom/input', to: 'palindrom#input'
  get 'palindrom/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end