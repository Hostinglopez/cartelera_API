require 'rest-client'

class NimbusController < ApplicationController
  def book
    begin
      response = RestClient.get('http://localhost:3001/books')
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def newbook
  end

  def create_book
    title = params[:title]
    author = params[:author]
    pdf_url = params[:pdf_url]

    begin
      payload = { title: title, author: author, pdf_url: pdf_url }.to_json
      response = RestClient.post('http://localhost:3001/books', payload, { content_type: :json, accept: :json })
      data = JSON.parse(response.body)
     render json: data
    
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def house
    begin
      response = RestClient.get('http://localhost:3001/houses')
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def newhouse
  end

  def create_house
    name = params[:name]
    founder = params[:founder]
    colors = params[:colors]
    animal = params[:animal]

    begin
      payload = { name: name, founder: founder, colors: colors, animal: animal }.to_json
      response = RestClient.post('http://localhost:3001/houses', payload, { content_type: :json, accept: :json })
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def character
    begin
      response = RestClient.get('http://localhost:3001/characters')
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def newcharacter
    @houses = []

    begin
      # Hacer la solicitud a la API externa para obtener las casas
      response = RestClient.get('http://localhost:3001/houses')
      @houses = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error("Error fetching houses: #{e.response.body}")
      # Manejamos el error, pero mantenemos @houses como un array vacío
    rescue StandardError => e
      Rails.logger.error("General error: #{e.message}")
      # Igual mantenemos @houses como un array vacío
    end
  end
  def create_character
    name = params[:character][:name]
    house_id = params[:character][:house_id]
    species = params[:character][:species]
    patronus = params[:character][:patronus]
    wand = params[:character][:wand]
  
    # Verificar que los parámetros no estén vacíos
    Rails.logger.info "Enviando los siguientes datos: Name: #{name}, House ID: #{house_id}, Species: #{species}, Patronus: #{patronus}, Wand: #{wand}"
  
    begin
      # Construir el payload con todos los parámetros anidados bajo 'character'
      payload = {
        character: {
          name: name,
          house_id: house_id.to_i,  # Asegúrate de que house_id sea un entero
          species: species,
          patronus: patronus,
          wand: wand
        }
      }.to_json
  
      # Enviar la solicitud a la API externa
      response = RestClient.post('http://localhost:3001/characters', payload, { content_type: :json, accept: :json })
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      # Muestra el cuerpo completo de la respuesta del error para depurar
      Rails.logger.error "Error: #{e.response}"
      render json: { error: e.response }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end
  
  
  def spell
    begin
      response = RestClient.get('http://localhost:3001/spells')
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def newspell
  end

  def create_spell
    name = params[:name]
    spell_type = params[:spell_type]
    effect = params[:effect]

    begin
      payload = { name: name, spell_type: spell_type, effect: effect }.to_json
      response = RestClient.post('http://localhost:3001/spells', payload, { content_type: :json, accept: :json })
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def user
    begin
      response = RestClient.get('http://localhost:3001/users')
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end

  def newuser
  end

  def create_user
    email = params[:email]
    password = params[:password]

    begin
      payload = { email: email, password: password }.to_json
      response = RestClient.post('http://localhost:3001/users', payload, { content_type: :json, accept: :json })
      data = JSON.parse(response.body)
      render json: data
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.message }, status: e.http_code
    rescue StandardError => e
      render json: { error: 'Ocurrió un error al procesar la solicitud' }, status: :internal_server_error
    end
  end
end
