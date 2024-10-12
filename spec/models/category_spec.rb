# spec/integration/categories_spec.rb
require 'swagger_helper'

RSpec.describe 'Categories API', type: :request do
  path '/categories' do
    get 'Retrieves all categories' do
      tags 'Categories'
      produces 'application/json'
      response '200', 'categories found' do
        run_test!
      end

      post 'Creates a category' do
        tags 'Categories'
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            genero: { type: :string }
          },
          required: ['genero']
        }
        response '201', 'category created' do
          let(:category) { { genero: 'Action' } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:category) { { genero: nil } }
          run_test!
        end
      end
    end
  end

  path '/categories/{id}' do
    get 'Retrieves a category' do
      tags 'Categories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Category ID'
      
      response '200', 'category found' do
        let(:id) { Category.create(genero: 'Action').id }
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    patch 'Updates a category' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Category ID'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          genero: { type: :string }
        },
        required: ['genero']
      }

      response '200', 'category updated' do
        let(:id) { Category.create(genero: 'Action').id }
        let(:category) { { genero: 'Comedy' } }
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'invalid' }
        let(:category) { { genero: 'Comedy' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Category.create(genero: 'Action').id }
        let(:category) { { genero: nil } }
        run_test!
      end
    end

    delete 'Deletes a category' do
      tags 'Categories'
      parameter name: :id, in: :path, type: :integer, description: 'Category ID'
      
      response '204', 'category deleted' do
        let(:id) { Category.create(genero: 'Action').id }
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/categories/{id}/movies' do
    get 'Retrieves all movies for a category' do
      tags 'Categories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Category ID'

      response '200', 'movies found' do
        let(:id) { Category.create(genero: 'Action').id }
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
