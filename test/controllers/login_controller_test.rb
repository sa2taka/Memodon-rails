require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get logout" do
    get login_logout_url
    assert_response :success
  end

end
