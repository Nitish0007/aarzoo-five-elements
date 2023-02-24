require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_login" do
    get admin_admin_login_url
    assert_response :success
  end
end
