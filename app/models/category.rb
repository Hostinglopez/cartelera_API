class Category < ApplicationRecord
  has_many :movie_categories
  has_many :movie, through: :movie_categories
end
