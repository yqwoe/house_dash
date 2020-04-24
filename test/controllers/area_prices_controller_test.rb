require 'test_helper'

class AreaPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_price = area_prices(:one)
  end

  test "should get index" do
    get area_prices_url, as: :json
    assert_response :success
  end

  test "should create area_price" do
    assert_difference('AreaPrice.count') do
      post area_prices_url, params: { area_price: { price: @area_price.price } }, as: :json
    end

    assert_response 201
  end

  test "should show area_price" do
    get area_price_url(@area_price), as: :json
    assert_response :success
  end

  test "should update area_price" do
    patch area_price_url(@area_price), params: { area_price: { price: @area_price.price } }, as: :json
    assert_response 200
  end

  test "should destroy area_price" do
    assert_difference('AreaPrice.count', -1) do
      delete area_price_url(@area_price), as: :json
    end

    assert_response 204
  end
end
