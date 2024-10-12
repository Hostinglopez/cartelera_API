class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  
  def movies_by_category
    category = Category.find_by(genero: params[:category_name])
  
      if category
        movies = category.movie
        render json: movies, status: :ok
      else
        render json: { error: 'Category not found' }, status: :not_found
      end
  end
  def movies_with_categories
    movie = Movie.find_by(titulo: params[:movie_name])
  
      if movie
        categories = movie.categories
        sumaries = movie.sumary
        
        render json: {
          movie: movie.titulo,
          categories: categories.map { |category| category.genero },
          sumaries: sumaries ? { sinopsis: sumaries.sinopsis, critica: sumaries.critica } : nil
        },status: :ok
          
        
      else
        render json: { error: 'Movie not found' }, status: :not_found
      end
  end

    
  # GET /movies
  def index
    @movies = Movie.all
    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:titulo, :fecha_lanzamiento).tap do |movie_params|
      # Convertir a solo fecha si se recibe una fecha con horas
      if movie_params[:fecha_lanzamiento].present?
        movie_params[:fecha_lanzamiento] = movie_params[:fecha_lanzamiento].to_date
      end
    end
  end
end