require 'test_helper'

class StoragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage = storages(:one)
  end

  test "should get index" do
    get storages_url, as: :json
    assert_response :success
  end

  test "should create storage" do
    assert_difference('Storage.count') do
      post storages_url, params: { storage: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show storage" do
    get storage_url(@storage), as: :json
    assert_response :success
  end

  test "should update storage" do
    patch storage_url(@storage), params: { storage: {  } }, as: :json
    assert_response 200
  end

  test "should destroy storage" do
    assert_difference('Storage.count', -1) do
      delete storage_url(@storage), as: :json
    end

    assert_response 204
  end
end
