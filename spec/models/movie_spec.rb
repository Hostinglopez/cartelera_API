require 'swagger_helper'

RSpec.describe 'Movies API', type: :request do
  path '/movies' do
    get 'Retrieves all movies' do
      tags 'Movies'
      produces 'application/json'
      response '200', 'movies found' do
        run_test!
      end

      post 'Creates a movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :movie, in: :body, schema: {
          type: :object,
          properties: {
            titulo: { type: :string },
            fecha_lanzamiento: { type: :string, format: :date },
            category_ids: { type: :array, items: { type: :integer } }
          },
          required: ['titulo', 'fecha_lanzamiento']
        }
        response '201', 'movie created' do
          let(:movie) { { titulo: 'Inception', fecha_lanzamiento: '2010-07-16', category_ids: [1, 2] } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:movie) { { titulo: nil, fecha_lanzamiento: nil } }
          run_test!
        end
      end
    end
  end

  path '/movies/{id}' do
    get 'Retrieves a movie' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Movie ID'
      
      response '200', 'movie found' do
        let(:id) { Movie.create(titulo: 'Inception', fecha_lanzamiento: '2010-07-16').id }
        run_test!
      end

      response '404', 'movie not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/movies_by_category' do
    get 'Retrieves movies by category' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :category_name, in: :query, type: :string, description: 'Category Name'

      response '200', 'movies found' do
        let(:category_name) { 'Fantasia' } # Cambiar esto por un género existente
        run_test!
      end

      response '404', 'category not found' do
        let(:category_name) { 'NonExistentCategory' }
        run_test!
      end
    end
  end

  path '/movies_with_categories' do
    get 'Retrieves categories and summary for a movie' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :movie_name, in: :query, type: :string, description: 'Movie Name'

      response '200', 'movie found' do
        let(:movie_name) { 'Sueño de Fuga' } # Cambiar esto por un título de película existente
        run_test!
      end

      response '404', 'movie not found' do
        let(:movie_name) { 'NonExistentMovie' }
        run_test!
      end
    end
  end
end

