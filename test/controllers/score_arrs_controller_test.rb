require 'test_helper'

class ScoreArrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score_arr = score_arrs(:one)
  end

  test "should get index" do
    get score_arrs_url, as: :json
    assert_response :success
  end

  test "should create score_arr" do
    assert_difference('ScoreArr.count') do
      post score_arrs_url, params: { score_arr: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show score_arr" do
    get score_arr_url(@score_arr), as: :json
    assert_response :success
  end

  test "should update score_arr" do
    patch score_arr_url(@score_arr), params: { score_arr: {  } }, as: :json
    assert_response 200
  end

  test "should destroy score_arr" do
    assert_difference('ScoreArr.count', -1) do
      delete score_arr_url(@score_arr), as: :json
    end

    assert_response 204
  end
end
