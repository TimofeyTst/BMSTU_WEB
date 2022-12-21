Rails.application.routes.draw do
  root 'palindrom#input'
  
  get 'palindrom/show'
  get 'palindrom/results'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
