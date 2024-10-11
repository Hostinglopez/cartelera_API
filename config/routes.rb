Rails.application.routes.draw do
  resources :movie_categories
  resources :sumaries
  resources :categories
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
