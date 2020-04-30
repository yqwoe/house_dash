class ProxyPoolsController < ApplicationController
  before_action :set_proxy_pool, only: [:show, :update, :destroy]

  # GET /proxy_pools
  def index
    @proxy_pools = ProxyPool.actived

    total = @proxy_pools.size

    render json:  ProxyPoolSerializer.new( @proxy_pools.page(params[:page]||1)).serializable_hash.merge({:total => total})
  end

  # GET /proxy_pools/1
  def show
    render json: @proxy_pool
  end

  # POST /proxy_pools
  def create
    @proxy_pool = ProxyPool.new(proxy_pool_params)

    if @proxy_pool.save
      render json: @proxy_pool, status: :created, location: @proxy_pool
    else
      render json: @proxy_pool.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proxy_pools/1
  def update
    if @proxy_pool.update(proxy_pool_params)
      render json: @proxy_pool
    else
      render json: @proxy_pool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proxy_pools/1
  def destroy
    @proxy_pool.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proxy_pool
      @proxy_pool = ProxyPool.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proxy_pool_params
      params.require(:proxy_pool).permit(:ip, :protocl, :port, :active, :source, :check_count)
    end
end
