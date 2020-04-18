class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :edit]
  before_action :find_beer, only: [:show, :update, :edit]
  respond_to :js, :json, :html

  def index
    @beers = Beer.all.order("name ASC")
  end

  def show
  end

  def edit; end

  def update
    if @beer.update(beer_params)
      redirect_to @beer, notice: "Beer was updated!"
    else
      render :edit
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :description, :location, :beer_type, :abv, :style)
  end

  def find_beer
    @beer = Beer.find(params[:id])
  end
end

