class MovieCategoriesController < ApplicationController
  before_action :set_movie_category, only: [:show, :update, :destroy]

  # GET /movie_categories
  def index
    @movie_categories = MovieCategory.all

    render json: @movie_categories
  end

  # GET /movie_categories/1
  def show
    render json: @movie_category
  end

  # POST /movie_categories
  def create
    @movie_category = MovieCategory.new(movie_category_params)

    if @movie_category.save
      render json: @movie_category, status: :created, location: @movie_category
    else
      render json: @movie_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_categories/1
  def update
    if @movie_category.update(movie_category_params)
      render json: @movie_category
    else
      render json: @movie_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_categories/1
  def destroy
    @movie_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_category
      @movie_category = MovieCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_category_params
      params.require(:movie_category).permit(:movie_id, :category_id)
    end
end
