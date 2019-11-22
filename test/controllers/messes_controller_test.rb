require 'test_helper'

class MessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mess = messes(:one)
  end

  test "should get index" do
    get messes_url, as: :json
    assert_response :success
  end

  test "should create mess" do
    assert_difference('Mess.count') do
      post messes_url, params: { mess: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mess" do
    get mess_url(@mess), as: :json
    assert_response :success
  end

  test "should update mess" do
    patch mess_url(@mess), params: { mess: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mess" do
    assert_difference('Mess.count', -1) do
      delete mess_url(@mess), as: :json
    end

    assert_response 204
  end
end
