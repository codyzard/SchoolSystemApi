require 'test_helper'

class ListRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_room = list_rooms(:one)
  end

  test "should get index" do
    get list_rooms_url, as: :json
    assert_response :success
  end

  test "should create list_room" do
    assert_difference('ListRoom.count') do
      post list_rooms_url, params: { list_room: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show list_room" do
    get list_room_url(@list_room), as: :json
    assert_response :success
  end

  test "should update list_room" do
    patch list_room_url(@list_room), params: { list_room: {  } }, as: :json
    assert_response 200
  end

  test "should destroy list_room" do
    assert_difference('ListRoom.count', -1) do
      delete list_room_url(@list_room), as: :json
    end

    assert_response 204
  end
end
