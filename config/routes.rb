Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    root 'home#show'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
