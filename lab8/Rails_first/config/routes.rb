Rails.application.routes.draw do
  root 'palindroms#input'
  get 'palindroms/input', to: 'palindroms#input'
  get 'palindroms/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
