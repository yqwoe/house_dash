require 'test_helper'

class ProxyPoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proxy_pool = proxy_pools(:one)
  end

  test "should get index" do
    get proxy_pools_url, as: :json
    assert_response :success
  end

  test "should create proxy_pool" do
    assert_difference('ProxyPool.count') do
      post proxy_pools_url, params: { proxy_pool: { active: @proxy_pool.active, check_count: @proxy_pool.check_count, ip: @proxy_pool.ip, port: @proxy_pool.port, protocl: @proxy_pool.protocl, source: @proxy_pool.source } }, as: :json
    end

    assert_response 201
  end

  test "should show proxy_pool" do
    get proxy_pool_url(@proxy_pool), as: :json
    assert_response :success
  end

  test "should update proxy_pool" do
    patch proxy_pool_url(@proxy_pool), params: { proxy_pool: { active: @proxy_pool.active, check_count: @proxy_pool.check_count, ip: @proxy_pool.ip, port: @proxy_pool.port, protocl: @proxy_pool.protocl, source: @proxy_pool.source } }, as: :json
    assert_response 200
  end

  test "should destroy proxy_pool" do
    assert_difference('ProxyPool.count', -1) do
      delete proxy_pool_url(@proxy_pool), as: :json
    end

    assert_response 204
  end
end
