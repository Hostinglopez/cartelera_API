class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:categories).all
    render json: @movies.as_json(include: :categories)
  end

  def show
    @movie = Movie.includes(:categories).find(params[:id])
    render json: @movie.as_json(include: :categories)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:titulo, :fecha_lanzamiento, category_ids: [])
  end
end
