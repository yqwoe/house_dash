class HomeController < ApplicationController
  def index
    render json: {v: '0.0.1',test: 'hello world!!!!!'}
  end
end
