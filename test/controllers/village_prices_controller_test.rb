require 'test_helper'

class VillagePricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @village_price = village_prices(:one)
  end

  test "should get index" do
    get village_prices_url, as: :json
    assert_response :success
  end

  test "should create village_price" do
    assert_difference('VillagePrice.count') do
      post village_prices_url, params: { village_price: { price: @village_price.price, v_id: @village_price.v_id, village_id: @village_price.village_id } }, as: :json
    end

    assert_response 201
  end

  test "should show village_price" do
    get village_price_url(@village_price), as: :json
    assert_response :success
  end

  test "should update village_price" do
    patch village_price_url(@village_price), params: { village_price: { price: @village_price.price, v_id: @village_price.v_id, village_id: @village_price.village_id } }, as: :json
    assert_response 200
  end

  test "should destroy village_price" do
    assert_difference('VillagePrice.count', -1) do
      delete village_price_url(@village_price), as: :json
    end

    assert_response 204
  end
end
