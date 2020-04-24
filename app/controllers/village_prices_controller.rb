class VillagePricesController < ApplicationController
  before_action :set_village_price, only: [:show, :update, :destroy]

  # GET /village_prices
  def index
    @village_prices = VillagePrice.all

    render json: @village_prices
  end

  # GET /village_prices/1
  def show
    render json: @village_price
  end

  # POST /village_prices
  def create
    @village_price = VillagePrice.new(village_price_params)

    if @village_price.save
      render json: @village_price, status: :created, location: @village_price
    else
      render json: @village_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /village_prices/1
  def update
    if @village_price.update(village_price_params)
      render json: @village_price
    else
      render json: @village_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /village_prices/1
  def destroy
    @village_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_price
      @village_price = VillagePrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def village_price_params
      params.require(:village_price).permit(:price, :v_id, :village_id)
    end
end
