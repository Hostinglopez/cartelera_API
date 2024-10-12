class Movie < ApplicationRecord
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  has_one :sumary

  
end



