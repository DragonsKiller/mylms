require 'test_helper'

class PracticalWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practical_work = practical_works(:one)
  end

  test "should get index" do
    get practical_works_url
    assert_response :success
  end

  test "should get new" do
    get new_practical_work_url
    assert_response :success
  end

  test "should create practical_work" do
    assert_difference('PracticalWork.count') do
      post practical_works_url, params: { practical_work: { description: @practical_work.description, name: @practical_work.name } }
    end

    assert_redirected_to practical_work_url(PracticalWork.last)
  end

  test "should show practical_work" do
    get practical_work_url(@practical_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_practical_work_url(@practical_work)
    assert_response :success
  end

  test "should update practical_work" do
    patch practical_work_url(@practical_work), params: { practical_work: { description: @practical_work.description, name: @practical_work.name } }
    assert_redirected_to practical_work_url(@practical_work)
  end

  test "should destroy practical_work" do
    assert_difference('PracticalWork.count', -1) do
      delete practical_work_url(@practical_work)
    end

    assert_redirected_to practical_works_url
  end
end
