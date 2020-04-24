require 'test_helper'

class CityPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_price = city_prices(:one)
  end

  test "should get index" do
    get city_prices_url, as: :json
    assert_response :success
  end

  test "should create city_price" do
    assert_difference('CityPrice.count') do
      post city_prices_url, params: { city_price: { price: @city_price.price } }, as: :json
    end

    assert_response 201
  end

  test "should show city_price" do
    get city_price_url(@city_price), as: :json
    assert_response :success
  end

  test "should update city_price" do
    patch city_price_url(@city_price), params: { city_price: { price: @city_price.price } }, as: :json
    assert_response 200
  end

  test "should destroy city_price" do
    assert_difference('CityPrice.count', -1) do
      delete city_price_url(@city_price), as: :json
    end

    assert_response 204
  end
end
