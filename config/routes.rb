Rails.application.routes.draw do
  resources :movie_categories, only: [:create, :destroy]
  resources :sumaries
  resources :categories do
    resources :movies, only: [:index]
   get 'movies_by_category', to: 'movies#movies_by_category'
  end

  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



