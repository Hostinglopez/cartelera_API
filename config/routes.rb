Rails.application.routes.draw do
  get 'nimbus/book'
  get 'nimbus/newbook', to: 'nimbus#newbook' 
  post 'nimbus/create_book', to: 'nimbus#create_book'
  get 'nimbus/house'
  get 'nimbus/newhouse', to: 'nimbus#newhouse' 
  post 'nimbus/create_house', to: 'nimbus#create_house'
  get 'nimbus/character'
  get 'nimbus/newcharacter', to: 'nimbus#newcharacter' 
  post 'nimbus/create_character', to: 'nimbus#create_character'
  get 'nimbus/spell'
  get 'nimbus/newspell', to: 'nimbus#newspell' 
  post 'nimbus/create_spell', to: 'nimbus#create_spell'
  get 'nimbus/user'
  get 'nimbus/newuser', to: 'nimbus#newuser' 
  post 'nimbus/create_user', to: 'nimbus#create_user'
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



