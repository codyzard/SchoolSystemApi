require 'test_helper'

class TeachStoragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teach_storage = teach_storages(:one)
  end

  test "should get index" do
    get teach_storages_url, as: :json
    assert_response :success
  end

  test "should create teach_storage" do
    assert_difference('TeachStorage.count') do
      post teach_storages_url, params: { teach_storage: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show teach_storage" do
    get teach_storage_url(@teach_storage), as: :json
    assert_response :success
  end

  test "should update teach_storage" do
    patch teach_storage_url(@teach_storage), params: { teach_storage: {  } }, as: :json
    assert_response 200
  end

  test "should destroy teach_storage" do
    assert_difference('TeachStorage.count', -1) do
      delete teach_storage_url(@teach_storage), as: :json
    end

    assert_response 204
  end
end
