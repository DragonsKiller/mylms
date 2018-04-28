require 'test_helper'

class AcademicPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_plan = academic_plans(:one)
  end

  test "should get index" do
    get academic_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_plan_url
    assert_response :success
  end

  test "should create academic_plan" do
    assert_difference('AcademicPlan.count') do
      post academic_plans_url, params: { academic_plan: { semester_id: @academic_plan.semester_id, subject_id: @academic_plan.subject_id } }
    end

    assert_redirected_to academic_plan_url(AcademicPlan.last)
  end

  test "should show academic_plan" do
    get academic_plan_url(@academic_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_plan_url(@academic_plan)
    assert_response :success
  end

  test "should update academic_plan" do
    patch academic_plan_url(@academic_plan), params: { academic_plan: { semester_id: @academic_plan.semester_id, subject_id: @academic_plan.subject_id } }
    assert_redirected_to academic_plan_url(@academic_plan)
  end

  test "should destroy academic_plan" do
    assert_difference('AcademicPlan.count', -1) do
      delete academic_plan_url(@academic_plan)
    end

    assert_redirected_to academic_plans_url
  end
end
