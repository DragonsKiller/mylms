require 'test_helper'

class LaboratoryWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laboratory_work = laboratory_works(:one)
  end

  test "should get index" do
    get laboratory_works_url
    assert_response :success
  end

  test "should get new" do
    get new_laboratory_work_url
    assert_response :success
  end

  test "should create laboratory_work" do
    assert_difference('LaboratoryWork.count') do
      post laboratory_works_url, params: { laboratory_work: { description: @laboratory_work.description, name: @laboratory_work.name } }
    end

    assert_redirected_to laboratory_work_url(LaboratoryWork.last)
  end

  test "should show laboratory_work" do
    get laboratory_work_url(@laboratory_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_laboratory_work_url(@laboratory_work)
    assert_response :success
  end

  test "should update laboratory_work" do
    patch laboratory_work_url(@laboratory_work), params: { laboratory_work: { description: @laboratory_work.description, name: @laboratory_work.name } }
    assert_redirected_to laboratory_work_url(@laboratory_work)
  end

  test "should destroy laboratory_work" do
    assert_difference('LaboratoryWork.count', -1) do
      delete laboratory_work_url(@laboratory_work)
    end

    assert_redirected_to laboratory_works_url
  end
end
