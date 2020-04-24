class CityPricesController < ApplicationController
  before_action :set_city_price, only: [:show, :update, :destroy]

  # GET /city_prices
  def index
    @city_prices = CityPrice.all

    render json: CityPriceSerializer.new(@city_prices).serializable_hash
  end

  # GET /city_prices/1
  def show
    render json: @city_price
  end

  # POST /city_prices
  def create
    @city_price = CityPrice.new(city_price_params)

    if @city_price.save
      render json: @city_price, status: :created, location: @city_price
    else
      render json: @city_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /city_prices/1
  def update
    if @city_price.update(city_price_params)
      render json: @city_price
    else
      render json: @city_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /city_prices/1
  def destroy
    @city_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_price
      @city_price = CityPrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_price_params
      params.require(:city_price).permit(:price)
    end
end
