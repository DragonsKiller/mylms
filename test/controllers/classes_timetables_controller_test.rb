require 'test_helper'

class ClassesTimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classes_timetable = classes_timetables(:one)
  end

  test "should get index" do
    get classes_timetables_url
    assert_response :success
  end

  test "should get new" do
    get new_classes_timetable_url
    assert_response :success
  end

  test "should create classes_timetable" do
    assert_difference('ClassesTimetable.count') do
      post classes_timetables_url, params: { classes_timetable: { semester_id: @classes_timetable.semester_id, subgroup_id: @classes_timetable.subgroup_id } }
    end

    assert_redirected_to classes_timetable_url(ClassesTimetable.last)
  end

  test "should show classes_timetable" do
    get classes_timetable_url(@classes_timetable)
    assert_response :success
  end

  test "should get edit" do
    get edit_classes_timetable_url(@classes_timetable)
    assert_response :success
  end

  test "should update classes_timetable" do
    patch classes_timetable_url(@classes_timetable), params: { classes_timetable: { semester_id: @classes_timetable.semester_id, subgroup_id: @classes_timetable.subgroup_id } }
    assert_redirected_to classes_timetable_url(@classes_timetable)
  end

  test "should destroy classes_timetable" do
    assert_difference('ClassesTimetable.count', -1) do
      delete classes_timetable_url(@classes_timetable)
    end

    assert_redirected_to classes_timetables_url
  end
end
