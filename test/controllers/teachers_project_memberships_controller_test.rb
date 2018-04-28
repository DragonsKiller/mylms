require 'test_helper'

class TeachersProjectMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teachers_project_membership = teachers_project_memberships(:one)
  end

  test "should get index" do
    get teachers_project_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_teachers_project_membership_url
    assert_response :success
  end

  test "should create teachers_project_membership" do
    assert_difference('TeachersProjectMembership.count') do
      post teachers_project_memberships_url, params: { teachers_project_membership: { project_id: @teachers_project_membership.project_id, teacher_id: @teachers_project_membership.teacher_id } }
    end

    assert_redirected_to teachers_project_membership_url(TeachersProjectMembership.last)
  end

  test "should show teachers_project_membership" do
    get teachers_project_membership_url(@teachers_project_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_teachers_project_membership_url(@teachers_project_membership)
    assert_response :success
  end

  test "should update teachers_project_membership" do
    patch teachers_project_membership_url(@teachers_project_membership), params: { teachers_project_membership: { project_id: @teachers_project_membership.project_id, teacher_id: @teachers_project_membership.teacher_id } }
    assert_redirected_to teachers_project_membership_url(@teachers_project_membership)
  end

  test "should destroy teachers_project_membership" do
    assert_difference('TeachersProjectMembership.count', -1) do
      delete teachers_project_membership_url(@teachers_project_membership)
    end

    assert_redirected_to teachers_project_memberships_url
  end
end
