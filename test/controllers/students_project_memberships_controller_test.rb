require 'test_helper'

class StudentsProjectMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_project_membership = students_project_memberships(:one)
  end

  test "should get index" do
    get students_project_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_students_project_membership_url
    assert_response :success
  end

  test "should create students_project_membership" do
    assert_difference('StudentsProjectMembership.count') do
      post students_project_memberships_url, params: { students_project_membership: { project_id: @students_project_membership.project_id, student_id: @students_project_membership.student_id } }
    end

    assert_redirected_to students_project_membership_url(StudentsProjectMembership.last)
  end

  test "should show students_project_membership" do
    get students_project_membership_url(@students_project_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_project_membership_url(@students_project_membership)
    assert_response :success
  end

  test "should update students_project_membership" do
    patch students_project_membership_url(@students_project_membership), params: { students_project_membership: { project_id: @students_project_membership.project_id, student_id: @students_project_membership.student_id } }
    assert_redirected_to students_project_membership_url(@students_project_membership)
  end

  test "should destroy students_project_membership" do
    assert_difference('StudentsProjectMembership.count', -1) do
      delete students_project_membership_url(@students_project_membership)
    end

    assert_redirected_to students_project_memberships_url
  end
end
