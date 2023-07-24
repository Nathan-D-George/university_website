require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get lessons_list_url
    assert_response :success
  end

  test "should get show" do
    get lessons_show_url
    assert_response :success
  end

  test "should get new" do
    get lessons_new_url
    assert_response :success
  end

  test "should get create" do
    get lessons_create_url
    assert_response :success
  end

  test "should get edit" do
    get lessons_edit_url
    assert_response :success
  end

  test "should get update" do
    get lessons_update_url
    assert_response :success
  end

  test "should get delete" do
    get lessons_delete_url
    assert_response :success
  end
end
