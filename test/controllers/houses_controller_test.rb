require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get houses_url, as: :json
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post houses_url, params: { house: { age: @house.age, area: @house.area, chaoxiang: @house.chaoxiang, feature: @house.feature, louceng: @house.louceng, louxing: @house.louxing, price: @house.price, quyu: @house.quyu, room: @house.room, shoufu: @house.shoufu, title: @house.title, total_price: @house.total_price, v_id: @house.v_id, village_id: @house.village_id, xiaoqu_: @house.xiaoqu_, xiuqu: @house.xiuqu, zuhangxiu: @house.zuhangxiu } }, as: :json
    end

    assert_response 201
  end

  test "should show house" do
    get house_url(@house), as: :json
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { age: @house.age, area: @house.area, chaoxiang: @house.chaoxiang, feature: @house.feature, louceng: @house.louceng, louxing: @house.louxing, price: @house.price, quyu: @house.quyu, room: @house.room, shoufu: @house.shoufu, title: @house.title, total_price: @house.total_price, v_id: @house.v_id, village_id: @house.village_id, xiaoqu_: @house.xiaoqu_, xiuqu: @house.xiuqu, zuhangxiu: @house.zuhangxiu } }, as: :json
    assert_response 200
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete house_url(@house), as: :json
    end

    assert_response 204
  end
end
