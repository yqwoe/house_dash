require 'test_helper'

class VillagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @village = villages(:one)
  end

  test "should get index" do
    get villages_url, as: :json
    assert_response :success
  end

  test "should create village" do
    assert_difference('Village.count') do
      post villages_url, params: { village: { age: @village.age, ave_price: @village.ave_price, building_count: @village.building_count, building_type: @village.building_type, comarea: @village.comarea, company: @village.company, count_id: @village.count_id, desc: @village.desc, district: @village.district, lh: @village.lh, name: @village.name, rj: @village.rj, tcw: @village.tcw, type_id: @village.type_id, v_id: @village.v_id, wy: @village.wy, wy_price: @village.wy_price } }, as: :json
    end

    assert_response 201
  end

  test "should show village" do
    get village_url(@village), as: :json
    assert_response :success
  end

  test "should update village" do
    patch village_url(@village), params: { village: { age: @village.age, ave_price: @village.ave_price, building_count: @village.building_count, building_type: @village.building_type, comarea: @village.comarea, company: @village.company, count_id: @village.count_id, desc: @village.desc, district: @village.district, lh: @village.lh, name: @village.name, rj: @village.rj, tcw: @village.tcw, type_id: @village.type_id, v_id: @village.v_id, wy: @village.wy, wy_price: @village.wy_price } }, as: :json
    assert_response 200
  end

  test "should destroy village" do
    assert_difference('Village.count', -1) do
      delete village_url(@village), as: :json
    end

    assert_response 204
  end
end
