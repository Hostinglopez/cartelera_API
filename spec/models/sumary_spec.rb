require 'swagger_helper'

RSpec.describe 'Sumaries API', type: :request do
  path '/sumaries' do
    get 'Retrieves all sumaries' do
      tags 'Sumaries'
      produces 'application/json'
      response '200', 'sumaries found' do
        run_test!
      end

      post 'Creates a sumary' do
        tags 'Sumaries'
        consumes 'application/json'
        parameter name: :sumary, in: :body, schema: {
          type: :object,
          properties: {
            sinopsis: { type: :string },
            critica: { type: :string },
            movie_id: { type: :integer }
          },
          required: ['sinopsis', 'critica', 'movie_id']
        }
        response '201', 'sumary created' do
          let(:sumary) { { sinopsis: 'Great movie!', critica: 'A must watch!', movie_id: 1 } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:sumary) { { sinopsis: nil, critica: nil, movie_id: nil } }
          run_test!
        end
      end
    end
  end

  path '/sumaries/{id}' do
    get 'Retrieves a sumary' do
      tags 'Sumaries'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Sumary ID'
      
      response '200', 'sumary found' do
        let(:id) { Sumary.create(sinopsis: 'Great movie!', critica: 'A must watch!', movie_id: 1).id }
        run_test!
      end

      response '404', 'sumary not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    patch 'Updates a sumary' do
      tags 'Sumaries'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'Sumary ID'
      parameter name: :sumary, in: :body, schema: {
        type: :object,
        properties: {
          sinopsis: { type: :string },
          critica: { type: :string },
          movie_id: { type: :integer }
        },
        required: ['sinopsis', 'critica']
      }

      response '200', 'sumary updated' do
        let(:id) { Sumary.create(sinopsis: 'Great movie!', critica: 'A must watch!', movie_id: 1).id }
        let(:sumary) { { sinopsis: 'Amazing movie!', critica: 'A must-see!', movie_id: 1 } }
        run_test!
      end

      response '404', 'sumary not found' do
        let(:id) { 'invalid' }
        let(:sumary) { { sinopsis: 'Amazing movie!', critica: 'A must-see!', movie_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Sumary.create(sinopsis: 'Great movie!', critica: 'A must watch!', movie_id: 1).id }
        let(:sumary) { { sinopsis: nil, critica: nil, movie_id: nil } }
        run_test!
      end
    end

    delete 'Deletes a sumary' do
      tags 'Sumaries'
      parameter name: :id, in: :path, type: :integer, description: 'Sumary ID'
      
      response '204', 'sumary deleted' do
        let(:id) { Sumary.create(sinopsis: 'Great movie!', critica: 'A must watch!', movie_id: 1).id }
        run_test!
      end

      response '404', 'sumary not found' do
        let(:id) { 'invalid' }
      end
    end
  end
end
