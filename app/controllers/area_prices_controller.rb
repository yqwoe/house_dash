class AreaPricesController < ApplicationController
  before_action :set_area_price, only: [:show, :update, :destroy]

  # GET /area_prices
  def index
    @area_prices = AreaPrice.all
    if params[:area_name]
      @area_prices =   @area_prices.where(:area_name => params[:area_name])
    end
    
    if params[:time]
      @area_prices =   @area_prices.where("time between  ? and  ?",params[:time][0],params[:time][1])
    end

    render json:AreaPriceSerializer.new( @area_prices).serializable_hash
  end

  def areas
    @area_names = AreaPrice.distinct.pluck(:area_name)

    render json: {data: @area_names}
  end

  # GET /area_prices/1
  def show
    render json: @area_price
  end

  # POST /area_prices
  def create
    @area_price = AreaPrice.new(area_price_params)

    if @area_price.save
      render json: @area_price, status: :created, location: @area_price
    else
      render json: @area_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /area_prices/1
  def update
    if @area_price.update(area_price_params)
      render json: @area_price
    else
      render json: @area_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /area_prices/1
  def destroy
    @area_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_price
      @area_price = AreaPrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_price_params
      params.require(:area_price).permit(:price)
    end
end
