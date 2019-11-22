require 'test_helper'

class LopHocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lop_hoc = lop_hocs(:one)
  end

  test "should get index" do
    get lop_hocs_url, as: :json
    assert_response :success
  end

  test "should create lop_hoc" do
    assert_difference('LopHoc.count') do
      post lop_hocs_url, params: { lop_hoc: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show lop_hoc" do
    get lop_hoc_url(@lop_hoc), as: :json
    assert_response :success
  end

  test "should update lop_hoc" do
    patch lop_hoc_url(@lop_hoc), params: { lop_hoc: {  } }, as: :json
    assert_response 200
  end

  test "should destroy lop_hoc" do
    assert_difference('LopHoc.count', -1) do
      delete lop_hoc_url(@lop_hoc), as: :json
    end

    assert_response 204
  end
end
