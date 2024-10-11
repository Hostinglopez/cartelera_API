class SumariesController < ApplicationController
  before_action :set_sumary, only: [:show, :update, :destroy]

  # GET /sumaries
  def index
    @sumaries = Sumary.all

    render json: @sumaries
  end

  # GET /sumaries/1
  def show
    render json: @sumary
  end

  # POST /sumaries
  def create
    @sumary = Sumary.new(sumary_params)

    if @sumary.save
      render json: @sumary, status: :created, location: @sumary
    else
      render json: @sumary.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sumaries/1
  def update
    if @sumary.update(sumary_params)
      render json: @sumary
    else
      render json: @sumary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sumaries/1
  def destroy
    @sumary.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sumary
      @sumary = Sumary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sumary_params
      params.require(:sumary).permit(:sinopsis, :critica, :movie_id)
    end
end
