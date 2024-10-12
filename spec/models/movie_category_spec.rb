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
end
