require 'test_helper'

class SubgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subgroup = subgroups(:one)
  end

  test "should get index" do
    get subgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_subgroup_url
    assert_response :success
  end

  test "should create subgroup" do
    assert_difference('Subgroup.count') do
      post subgroups_url, params: { subgroup: { group_id: @subgroup.group_id, name: @subgroup.name } }
    end

    assert_redirected_to subgroup_url(Subgroup.last)
  end

  test "should show subgroup" do
    get subgroup_url(@subgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_subgroup_url(@subgroup)
    assert_response :success
  end

  test "should update subgroup" do
    patch subgroup_url(@subgroup), params: { subgroup: { group_id: @subgroup.group_id, name: @subgroup.name } }
    assert_redirected_to subgroup_url(@subgroup)
  end

  test "should destroy subgroup" do
    assert_difference('Subgroup.count', -1) do
      delete subgroup_url(@subgroup)
    end

    assert_redirected_to subgroups_url
  end
end
