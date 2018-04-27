require 'test_helper'

class BrigadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brigade = brigades(:one)
  end

  test "should get index" do
    get brigades_url
    assert_response :success
  end

  test "should get new" do
    get new_brigade_url
    assert_response :success
  end

  test "should create brigade" do
    assert_difference('Brigade.count') do
      post brigades_url, params: { brigade: { name: @brigade.name } }
    end

    assert_redirected_to brigade_url(Brigade.last)
  end

  test "should show brigade" do
    get brigade_url(@brigade)
    assert_response :success
  end

  test "should get edit" do
    get edit_brigade_url(@brigade)
    assert_response :success
  end

  test "should update brigade" do
    patch brigade_url(@brigade), params: { brigade: { name: @brigade.name } }
    assert_redirected_to brigade_url(@brigade)
  end

  test "should destroy brigade" do
    assert_difference('Brigade.count', -1) do
      delete brigade_url(@brigade)
    end

    assert_redirected_to brigades_url
  end
end
