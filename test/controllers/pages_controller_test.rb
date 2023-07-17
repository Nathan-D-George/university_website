require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get courses" do
    get pages_courses_url
    assert_response :success
  end

  test "should get residences" do
    get pages_residences_url
    assert_response :success
  end
end
