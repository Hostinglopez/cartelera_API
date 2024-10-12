Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :movies, only: [:create]
  resources :categories do 
    resources :movies, only: [:index]
  end
  resources :sumaries, only: [:create]
  resources :movie_categories, only: [:create]
  get 'movies_by_category', to: 'movies#movies_by_category'
  get 'movies_with_categories', to: 'movies#movies_with_categories'
  resources :movies
  resources :sumaries
  resources :movie_categories


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



