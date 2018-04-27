require 'test_helper'

class BrigadeMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brigade_membership = brigade_memberships(:one)
  end

  test "should get index" do
    get brigade_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_brigade_membership_url
    assert_response :success
  end

  test "should create brigade_membership" do
    assert_difference('BrigadeMembership.count') do
      post brigade_memberships_url, params: { brigade_membership: { brigade_id: @brigade_membership.brigade_id, student_id: @brigade_membership.student_id } }
    end

    assert_redirected_to brigade_membership_url(BrigadeMembership.last)
  end

  test "should show brigade_membership" do
    get brigade_membership_url(@brigade_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_brigade_membership_url(@brigade_membership)
    assert_response :success
  end

  test "should update brigade_membership" do
    patch brigade_membership_url(@brigade_membership), params: { brigade_membership: { brigade_id: @brigade_membership.brigade_id, student_id: @brigade_membership.student_id } }
    assert_redirected_to brigade_membership_url(@brigade_membership)
  end

  test "should destroy brigade_membership" do
    assert_difference('BrigadeMembership.count', -1) do
      delete brigade_membership_url(@brigade_membership)
    end

    assert_redirected_to brigade_memberships_url
  end
end
